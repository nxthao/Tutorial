'''
refer to: https://www.geeksforgeeks.org/args-kwargs-python/
'''
print ("Pass multiple value to function")

def myNumber(*value):
    for a in value:
        print(a)

def myDictionary(**dic):
    print(dic)
    for a in dic:
        print(a)

print("Pass mutiple value to the function ")
myNumber(2,4,6,8,10)

print("Pass multiple values with key to the function ")
number = {"One": 1, "Wto": "2", "Three": "3"}
myDictionary(**number)

# The number is unable to place with key: ex: myDictionary(1 = one) or number = {1 : "one"}
myDictionary(one = 1, wto = 2, three = 3)