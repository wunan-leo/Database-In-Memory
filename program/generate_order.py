from faker import Faker
import pandas as pd
import csv
import random
from tqdm import tqdm
from datetime import datetime

fake = Faker()

def generate(filename, num):
    datetime_start = datetime(2018, 1, 1, 0, 0)
    datetime_end = datetime(2023, 12, 30, 23, 0)
    with open(filename, 'w', newline='', encoding='utf-8') as f:
        writer = csv.writer(f)
        writer.writerow(['order_id', 'customer_id', 'order_time', 'customer_num', 'total_price', 'order_status'])
        for idx in tqdm(range(1, num + 1)):
            order_id = idx
            customer_id = random.randint(1, 1000000)
            order_time = fake.date_time_between_dates(datetime_start, datetime_end)
            customer_num = random.randint(1, 10)
            total_price = round(random.uniform(50, 1000) * customer_num, 2)
            order_status = 0
            writer.writerow([order_id, customer_id, order_time, customer_num, total_price, order_status])


if __name__ == '__main__':
    generate('./order.csv', 10000000)