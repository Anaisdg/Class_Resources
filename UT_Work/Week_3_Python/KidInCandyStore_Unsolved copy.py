# The list of candies to print to the screen
candy_list = ["Snickers", "Kit Kat", "Sour Patch Kids", "Juicy Fruit", "Sweedish Fish", "Skittles", "Hershey Bar", "Skittles", "Starbursts", "M&Ms"]

# The amount of candy the user will be allowed to choose
allowance = 5

# The list used to store all of the candies selected inside of
candy_cart = []

# Ask the user for an input

for candy in candy_list:
	candy_index=candy_list.index(candy)
	print("[" +str(candy_index) + "]" + candy)

While allowance>0:
	user_choice= input("Pick a candy")
	selected_candy= candy_list[int(user_choice)]
	
	candy_cart.append(str(selected_candy))
	allowance=allowance-1

print("I brought with me ...")
For candy in candy_cart:
	print(candy)