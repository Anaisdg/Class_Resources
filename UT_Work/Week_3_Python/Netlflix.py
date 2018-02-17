import os
import csv

csvpath="Netflix_ratings copy.cvs"

video=input("What show or movie are you looking for?")


with open(csvpath, newline='') as csvfile:

    csvreader= csv.reader(csvfile, delimeters=',')

    for row in csvreader:
        if row[0]==video:
            print(row[0]+ "is rated"+ row[1] + "with a rating of" + row[6])