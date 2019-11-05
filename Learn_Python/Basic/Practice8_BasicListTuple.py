a = [1,2,3,4,5,6,7,8]
print(a)
print(a[1:-1])
b = a[1:5]
print(b)
# increase step
b = a[1:-1:2]
print(b)

# decrease
b = a[5:0:-1]
print(b)

c = list(range(10,20))

print(c)

print(type(a))
print(type(b))
print(type(c))
d = (2,4,6,8)

print(d)
print(type(d))

e = (1)
print(type(e))