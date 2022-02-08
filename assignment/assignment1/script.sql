-- 判断手机号是否有效
CREATE OR REPLACE FUNCTION is_mobile(phone VARCHAR2) 
    RETURN BOOLEAN IS

    v_phone VARCHAR2(20);
    v_head VARCHAR2(2);
BEGIN
    IF phone IS NULL THEN
        RETURN FALSE;
    END IF;

    v_phone := TRIM(phone);
	
    IF substr(v_phone,0,1) = '0' THEN
        v_phone := substr(v_phone, 2);
    END IF;

    -- 判断手机号第一位是否为1 长度是否为11
    IF substr(v_phone,0,1) <> '1' OR LENGTH(v_phone) <> 11 THEN
        RETURN FALSE;
    END IF;

    v_head := substr(v_phone,1,2);

    IF v_head = '13' OR v_head = '14' OR v_head ='15' OR v_head ='17' OR v_head = '18' THEN
        RETURN TRUE;
    ELSE
        RETURN FALSE;
    END IF;   
END;
/

-- 初始化
CREATE OR REPLACE PROCEDURE init IS
    CURSOR job_cursor IS SELECT JOB FROM user_jobs;
BEGIN
    EXECUTE IMMEDIATE 'update t_lock set f_index=0';
	
    EXECUTE IMMEDIATE 'truncate table t_log';
	
    EXECUTE IMMEDIATE 'update t_records set f_province = NULL,f_platform=NULL, f_mobile=-1';
    COMMIT;
    
    FOR tmp_job IN job_cursor LOOP 
        dbms_job.broken(tmp_job.JOB,TRUE,sysdate);
        dbms_job.REMOVE(tmp_job.JOB);    
    END LOOP;  
END;
/

CREATE OR REPLACE PROCEDURE show IS
    v_record_count NUMBER;
	
    v_log_count NUMBER;
	
    v_current_index NUMBER;
	
    -- 游标
    CURSOR job_cursor IS SELECT * FROM user_jobs;
	
BEGIN
    SELECT COUNT(1) INTO v_log_count FROM t_log;
    SELECT f_index INTO v_current_index FROM t_lock;
    SELECT COUNT(1) INTO v_record_count FROM t_records;
    
	dbms_output.put_line('log count: '||v_log_count);
    dbms_output.put_line('record count: '||v_record_count);    
    dbms_output.put_line('current index: '||v_current_index);

    FOR tmp_job IN job_cursor LOOP 
        dbms_output.put_line('job:'||tmp_job.JOB||',broken:'||tmp_job.broken||',total_time:'||tmp_job.total_time||',failures:'||tmp_job.failures||',interval:'||tmp_job.INTERVAL||',last_sec:'||tmp_job.last_sec||',next_sec:'||tmp_job.next_sec);

    END LOOP;
END;
/

CREATE OR REPLACE PROCEDURE process_data(process_no IN NUMBER, batch_size IN NUMBER) IS 
    c_record_index CONSTANT VARCHAR2(20)   :='_RECORD_INDEX';
    c_process_prefix CONSTANT VARCHAR2(20) := '[  PROCESS ]';
    c_select_record_sql VARCHAR2(100)  := 'select * from t_records where f_id >= :x and f_id <= :y';
    c_select_mobile_sql VARCHAR2(100)  := 'select * from t_mobiles where f_mobile_head = :x';
    c_update_mobile_sql VARCHAR2(100)  := 'update t_records set f_province = :x, f_platform = :y, f_mobile = 1 where f_id = :z';
    c_update_record_sql VARCHAR2(100)  := 'update t_records set f_mobile = 0 where f_id = :n';

    v_record_count NUMBER;
    v_current_index NUMBER;
    v_begin_index NUMBER;
    v_end_index NUMBER;
    
    v_id NUMBER;
    v_phone VARCHAR2(20);
    v_province VARCHAR2(20);
    v_platform VARCHAR2(20);
    
    TYPE ty_record_cursor IS REF CURSOR;
    record_cursor ty_record_cursor;
    mobile_cursor ty_record_cursor;
    
    v_record_row t_records%rowtype;
    v_mobile_row t_mobiles%rowtype;

BEGIN
    SELECT COUNT(1) INTO v_record_count FROM t_records;

    LOOP
        SELECT f_index INTO v_current_index FROM t_lock WHERE f_name = c_record_index FOR UPDATE;

        IF v_current_index = v_record_count THEN
            EXIT;
        END IF;

        v_end_index := v_current_index + batch_size;      
        IF v_end_index > v_record_count THEN
            v_end_index := v_record_count;
        END IF;

        UPDATE t_lock SET f_index = v_end_index WHERE f_name =c_record_index;
        COMMIT;
        
        v_begin_index := v_current_index +1;
        
        OPEN record_cursor FOR c_select_record_sql USING v_begin_index, v_end_index;
        LOOP
            FETCH record_cursor INTO v_record_row;
            EXIT WHEN record_cursor%notfound;
            
            v_id    := v_record_row.f_id;
            v_phone := v_record_row.f_no;
            
            IF is_mobile(v_phone) THEN

                v_phone := TRIM(v_phone);
                IF substr(v_phone,0,1) = '0' THEN
                    v_phone := substr(v_phone, 2);
                END IF;
                
                OPEN mobile_cursor FOR c_select_mobile_sql USING substr(v_phone,1,7);
                    FETCH mobile_cursor INTO v_mobile_row;
                    v_province := v_mobile_row.f_province;
                    v_platform := v_mobile_row.f_platform;
                CLOSE mobile_cursor;
                
                EXECUTE IMMEDIATE c_update_mobile_sql USING v_province,v_platform,v_id;     
            ELSE
			
                EXECUTE IMMEDIATE c_update_record_sql USING v_id;
            END IF;
			
            COMMIT;
            
        END LOOP;
        CLOSE record_cursor;
        

    END LOOP;

EXCEPTION
    WHEN OTHERS THEN
        dbms_output.put_line('Error code: '||SQLCODE); 
        dbms_output.put_line('Error mesg: '||sqlerrm);  
END;
/

CREATE OR REPLACE PROCEDURE generate_csv_report IS  
	c_report_prefix CONSTANT VARCHAR2(20) := '[  REPORT  ]';
    v_report_1  UTL_FILE.FILE_TYPE;
    v_report_2  UTL_FILE.FILE_TYPE;
    CURSOR report_1_cursor IS SELECT f_platform,f_province,SUM(f_duration) total FROM t_records WHERE f_mobile=1 GROUP BY f_platform,f_province ORDER BY f_platform ASC,SUM(f_duration) DESC;
    CURSOR report_2_cursor IS SELECT f_province,f_platform,SUM(f_duration) total FROM t_records WHERE f_mobile=1 GROUP BY f_province,f_platform ORDER BY f_province ASC,SUM(f_duration) DESC;
BEGIN

    v_report_1 := UTL_FILE.FOPEN( LOCATION => 'EXTERNAL_DATA', filename => 'report1.csv', open_mode => 'w', max_linesize => 32767);
    
    FOR cur_tmp IN report_1_cursor LOOP
        UTL_FILE.PUT_LINE(v_report_1, cur_tmp.f_platform || ',' || cur_tmp.f_province || ',' || cur_tmp.total);
    END LOOP;
    UTL_FILE.FCLOSE(v_report_1);
    
    v_report_2 := UTL_FILE.FOPEN( LOCATION => 'EXTERNAL_DATA', filename => 'report2.csv', open_mode => 'w', max_linesize => 32767);
                                
    FOR cur_tmp IN report_2_cursor LOOP
        UTL_FILE.PUT_LINE(v_report_2, cur_tmp.f_province || ',' || cur_tmp.f_platform || ',' ||  cur_tmp.total);
    END LOOP;
    UTL_FILE.FCLOSE(v_report_2);

    
    EXCEPTION
        WHEN OTHERS THEN
            dbms_output.put_line('Error code: '||SQLCODE); 
            dbms_output.put_line('Error mesg: '||sqlerrm);  
END;
/

CREATE OR REPLACE PROCEDURE analysis (job_count IN NUMBER, batch_size IN NUMBER)IS
    c_record_index CONSTANT VARCHAR2(20)	:='_RECORD_INDEX';
	c_analysis_prefix CONSTANT VARCHAR2(20)	:= '[ ANALYSIS ]';
    
    v_record_index NUMBER;
    
    v_record_count NUMBER;

    v_tmp_jobno NUMBER;

    v_begin_time NUMBER;
    v_process_end_time NUMBER;
    v_analysis_end_time NUMBER;

    e_invalid_input EXCEPTION;

BEGIN

    IF job_count < 1 OR batch_size<1 THEN
        RAISE e_invalid_input;
    END IF;
    
    v_begin_time := dbms_utility.get_time;

    SELECT COUNT(1) INTO v_record_count FROM t_records;

    UPDATE t_lock SET f_index=0 WHERE f_name=c_record_index;  
    COMMIT;


    FOR I IN 1.. job_count LOOP   
        dbms_job.submit(v_tmp_jobno,'begin process_data('||I||','||batch_size||'); end;'); 
    END LOOP; 


    LOOP
        SELECT f_index INTO v_record_index FROM t_lock WHERE f_name = c_record_index;

        IF v_record_index = v_record_count THEN
            EXIT;
        ELSE 
            dbms_lock.sleep(5);
        END IF;  
    END LOOP;

    v_process_end_time := dbms_utility.get_time;
    dbms_output.put_line('process, elapsed time: '||(v_process_end_time-v_begin_time)/100||' seconds.');
    
    generate_csv_report;
    
    v_analysis_end_time := dbms_utility.get_time;

    dbms_output.put_line('report, elapsed time: '||(v_analysis_end_time-v_process_end_time)/100||' seconds.');

EXCEPTION 
    WHEN e_invalid_input THEN
        dbms_output.put_line('Invalid input values, job_count:'||job_count||', batch_size:'||batch_size); 
    WHEN OTHERS THEN
        dbms_output.put_line('Error code: '||SQLCODE); 
        dbms_output.put_line('Error mesg: '||sqlerrm); 
END;
/
