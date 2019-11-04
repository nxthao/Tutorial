'''
store ={product:[price, quantity]}
'''

def importProduct(product, price, quantity):
    if product in store:
        store[product][0] = price
        store[product][1] += quantity
    else: # product does not have in store
        store[product] = [price, quantity]
    pass

def shopping(product, quantity):
    total = 0
    print("Buy %s with quantity: %s " %(product, quantity))
    if product in store:
        if store[product][1] >= quantity:
            total = quantity * store[product][0]
            store[product][1] -= quantity 
        else:
            print("Product sold out")

        if (store[product][1] == 0):
            del store[product]
    else:
        print("product does not have in store")
    
    return total

def showStore(store):
    print("Show the whole product in store")
    for p in store:
        print("Product: ", p)
        print("Price: ", store[p][0])
        print("Quantity: ", store[p][1])
    pass

store = {"orange":[10, 20], "apple":[15,25]}
showStore(store)

importProduct("orange", 7, 50)
showStore(store)

myReceipt = shopping("apple", 25)
print("Total receipt: ", myReceipt)
showStore(store)
