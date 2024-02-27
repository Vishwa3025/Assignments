import csv,os
# Add Product Function

def addProduct():
    print("\n")
    print("Add a New Product")

    productId = int(input("Enter the Product ID: "))
    productName = input("Enter the Product Name: ")
    category = input("Enter the Category: ")
    price = int(input("Enter the Price: "))
    quantity = int(input("Enter the Quantity: "))
    
    if productId in inventory:
        print("The Product is existing with the ID you have entered. Please choose a Different ID.")
    else:
        inventory[productId] = {'ProductId' : productId,
                                'ProductName' : productName,
                                'Category' : category,
                                'Price' : price,
                                'Quantity' : quantity}
        return

# Update Product Function
    
def updateProduct():
    print("\n")
    print("Update Existing Product")

    id = int(input("Enter the Product ID to update: "))
    if id not in inventory:
        print("\nProduct with this ID doesn't exist. Plaese enter different ID")
        return
    
    print("\n")
    print("1. Update Product Name")
    print("2. Update Category")
    print("3. Update Price")
    print("4. Update Quantity")

    choice = int(input("Enter your choice: "))
    
    match choice:
        case 1:
            inventory[id]['ProductName'] = input("Enter new Product Name: ")
        case 2:
            inventory[id]['Category'] = input("Enter new Category: ")
        case 3:
            inventory[id]['Price'] = int(input("Enter new Price: "))
        case 4:
            inventory[id]['Quantity'] = int(input("Enter new Quantity: "))
    print("\nProduct Updated Successfully.")



# Display Inventory Function
    
def displayInventory():
    print("{:<15} {:<15} {:<15} {:<15} {:<15}".format('Product ID','Product Name', 'Category', 'Price', 'Quantity'))
    for key, value in inventory.items():
        id, name, category, price, quantity = value['ProductId'], value['ProductName'], value['Category'], value['Price'], value['Quantity']
        print("{:<15} {:<15} {:<15} {:<15} {:<15}".format(id, name, category, price, quantity))

    return


def saveInventory():

    file_exists = os.path.exists('Inventory_Management.csv')

    mode = 'a' if file_exists else 'w'

    with open('Inventory_Management.csv', mode, newline='') as f:
        header = ['Product ID', 'Product Name', 'Category', 'Price', 'Quantity']
        write = csv.DictWriter(f, fieldnames=header)

        if not file_exists:
            write.writeheader()

        for value in inventory.values():
            write.writerow({'Product ID': value['ProductId'],
                             'Product Name': value['ProductName'],
                             'Category': value['Category'],
                             'Price': value['Price'],
                             'Quantity': value['Quantity']})

    print("Inventory Saved Successfully.")

# Main function

inventory = {}
while True:
    print('Menu:')
    print('1. Add Product')
    print('2. Update Product')
    print('3. Display Inventory')
    print('4. Save and Exit')

    choice = int(input('Enter your Choice: '))
    
    match choice:
        case 1:
            addProduct()
            print("\nProduct added Successfully.")
        case 2:
            updateProduct()
        case 3:
            displayInventory()
        case 4:
            saveInventory()
            break
        case any:
            print("Invalid Choice.")
            break

