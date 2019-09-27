'''
Print fibonacci
n = 7
# 1 1 2 3 4 5 13
'''
n = 7
a1 = 1
a2 = 1
print("Fibonaci with 7 numbers is ")
print (a1, end = " ")
print (a2, end = " ")
for i in range (1, n - 1):
    tmp = a2
    a2 += a1
    a1 = tmp
    print(a2, end = " ")