# -*- coding: UTF-8 -*-
#create name input
names = input("List 5 people that you know")
splitnames = names.split()
#create comprehension so that all items in list are lowercased
lowernames =  [names.lower() for names in splitnames]
#create comprehension so that all items in list are capitalized 
capitalizednames = [names.title() for names in lowernames]
#create comprehension so that list is created with different letters
letters = [f"Dear {names}, please come to the wedding this Saturday!" for names in capitalizednames]

for letters in letters:
    print(letters)
