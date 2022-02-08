from faker import Faker
import csv

fake = Faker()


def generate_phone_number(n):
    a = set()
    while len(a) != n:
        a.add(str(fake.pyint(10000000000, 19999999999)))
    return list(a)


if __name__ == "__main__":
    with open('/Users/algiz/Desktop/test/host.csv', 'a+') as file:
        reader = csv.reader(file)
        writer = csv.writer(file)
        phone_number_list = generate_phone_number(10)
        for i in range(10):
            writer.writerow([
                str(1),
                fake.pystr(8, 12),
                fake.pystr(10, 16),
                str(phone_number_list[i])
            ])
    with open('/Users/algiz/Desktop/test/customer.csv', 'a+') as file:
        reader = csv.reader(file)
        writer = csv.writer(file)
        phone_number_list = generate_phone_number(10)
        for i in range(10):
            writer.writerow([
                str(1),
                fake.pystr(8, 12),
                fake.pystr(10, 16),
                str(phone_number_list[i])
            ])
