store_dictionary={
    "bananas": 1,
    "oranges": 3,
    "steak": 1
}

manage_system = "y"

while manage_system == "y":
    action_item = input("Do you want to add item (A), remove item (B), list all (C) ")
    manage_system = input( "Would you like to continue? y/n")
    if action_item == "A":
        # Prompt the user for name and value 
        item_added = input("Name: ")
        amount_added = input("Ammount")
        # replace data with new ammount
        store_dictionary[item_added] = int(amount_added)
    elif action_item == "B":
        item_to_remove = input("Name: ")
        if item_to_remove in store_dictionary:
            del store_dictionary[item_to_remove]
    else:
        for key, valye in store_dictionary.items():
            print(key, value)


