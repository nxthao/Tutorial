'''
store:
    name
    price
    quantity
'''
p = [['pen', 10, 2], ['ruler', 20, 5]]

def importProduct(product, name, price, quantity):
    for i in product:
        if name in i:
            i[1] = price
            i[2] = i[2] + quantity
            print(i)
    pass # intial a empty function

def exportProduct(product, name, quantity):
    for i in product:
        if name in i:
            i[2] = i[2] - quantity;

            if i[2] < 0:
                del i

def showProduct(product):
    for i in product:
        print("The item: %s. The price: %sk. Quantity: %s" %(i[0], i[1], i[2]))

print('Show the production list')
showProduct(p)

print("The first production name: ", p[0][0])

print("Add the production in store")
p.append(["eraser", 2, 10])

print('Show the production list')
showProduct(p)

print("take a pen from store")
p[0][2] = p[0][2] - 1;
print(p[0][2])

print('Show the production list')
showProduct(p)

importProduct(p, "pen", 15, 50)
showProduct(p)

print("Take 4 ruler")
exportProduct(p, "ruler", 4)
showProduct(p)

