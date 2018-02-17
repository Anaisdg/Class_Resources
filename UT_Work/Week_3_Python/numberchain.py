userplay = "y"

while userplay == "y":

    numberchain = input("How many numbers")

    for num in range(int(numberchain)+1):
        print(num)

    userplay = input("Continue? y/n")
