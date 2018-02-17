
shopping="y"

pie_purchases=[]

pie_list = ["Pecan", "Apple Crisp", "Bean", "Banoffee", "Black Bun", "Blueberry", "Buko", "Burek", "Tamale", "Steak"]

print("Welcome to the House of Pies! Here are our pies:")

while shopping=="y":

        print("________________________________________________")
        print("(1) Pecan, (2) Apple Crisp, (3) Bean, (4) Banoffee, " +
        " (5) Black Bun, (6) Blueberry, (7) Buko, (8) Burek, " +
        " (9) Tamale, (10) Steak ")

    order=input("Select your pire via number")
    pie_purchases.append(order)

    print("________________________________________________")

    pie_index=int(order)-1

    print("Great! We'll have that " + pie_list[pie_index] + " right out for you.)             

    shopping=input("Would you like another pie? (y)es or (n)o?")

print("________________________________________________")

print(str(len(pie_purchases)))

