import os
import csv

reader = csv.reader(open('employee_data1.csv', 'rb'))
writer = csv.writer(open('output.csv', 'w'))
headers = reader.next()
headers.append("Brand New Awesome Header")
writer.write(headers)
for row in reader:
    row.append("data")
    writer.write(row)

     # Lists to store data
# EmpID = []
# Name = []
# First_Name = []
# Last_Name = []
# DOB = []
# SSN_secure = []
# State = []

# with open(udemy_csv, newline="") as csvfile:

    # csvreader= csv.reader(csvfile, delimiter=",")

    # for row in csvreader:
    #     # Add title
    #     EmpID.append(row[0])

    #     # Split first and last name
    #     split_names = Name.split()

    #      # Add first name
    #     First_Name.append(split_names[0])

    #     # Add last name
    #     Last_Name.append(split_names[1])

    #     # Split SSN
    #     split_ssn = 
    #     SSN_secure.append(row[7])

    #     # Determine percent of review left to 2 decimal places
    #     percent = round(int(row[6])/int(row[5]), 2)
    #     review_percent.append(percent)

    #     # Get length of the course to just a number
    #     new_length = row[9].split(" ")
    #     length.append(new_length[0])