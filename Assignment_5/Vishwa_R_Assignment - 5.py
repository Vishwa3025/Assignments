# Add Product Function
def addProduct():
    return

# Update Product Function
def updateProduct():
    return

# Display Inventory Function
def displayInventory():
    return



# Main function
while True:
    print('Menu:')
    print('1. Add Product')
    print('1. Update Product')
    print('3. Display Inventory')
    print('4. Exit')

    choice = int(input('Enter your Choice: '))
    
    match choice:
        case 1:
            addProduct()
        case 2:
            updateProduct()
        case 3:
            displayInventory()
        case 4:
            break

