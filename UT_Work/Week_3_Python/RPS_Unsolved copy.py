# Incorporate the random library
import random

# Print Title
print("Let's Play Rock Paper Scissors!")

# Specify the three options
options = ["r", "p", "s"]

# Computer Selection
computer_choice = random.choice(options)

# User Selection
user_choice = input("Make your Choice: (r)ock, (p)aper, (s)cissors? ")

if (user_choice==computer_choice):
	print("It's a tie!")

elif (user_choice=="r" and computer_choice=="p"):
	print("You lose!")

elif (user_choice=="s" and computer_choice=="p"):
	print("You win!")

elif (user_choice=="p" and computer_choice=="s"):
	print("You lose!")
	
elif (user_choice=="r" and computer_choice=="s"):
	print("You win!")

elif (user_choice=="p" and computer_choice=="r"):
	print("You win!")

elif (user_choice=="s" and computer_choice=="r"):
	print("You lose!")
else:
	print("Invalid choice")

# Run Conditionals
