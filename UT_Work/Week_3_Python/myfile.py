import os

with open("myfile.txt", 'r') as text:
    #read one line
    #line=textfile.readline()
    #line2=textfile.readline()
    #print(line,line2)

    #for line in textfile:
        #print(line)

    #find the sum of all of the lines
   total = 0 
   for line in text:
       number = int(line)
       total = total + number

print(total)

#if reveneues is a dictionary
#print(f' Rev for china: film["revenues"]["China"]')
#print(f' Here are {names}')
#print("Here are {} the names: {}".format("test1","test2"))
# Here are the test1 the names: test2