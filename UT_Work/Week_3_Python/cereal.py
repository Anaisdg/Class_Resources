import os
import csv


with open("cereal_bonus.csv", newline="") as csvfile:

    csvreader= csv.reader(csvfile, delimiter=",")
     #to skip the header. None eliminates error after it goes through entire row to just execute the next line    
    next(csvreader, None)    
    for row in csvreader: 
        #create variable so it's descriptive 
        fiber=row[7]
        if float(row[7]) >= 5:
            print(row[0:7])