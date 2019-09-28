# resolve program range 2
import math
# In python range of variable is not limit: example a = 1234354365754

#  input will be string, need to casting it int
a = int(input("Please input the a variable: "))
b = int(input("Please input the b variable: "))
c = int(input("Please input the c variable: "))

print ("type of a", type(a)) 
print ("type of b", type(b))
print ("type of c", type(c))

print ("Solve quadratic equation")
d = int(b)**2 - 4*int(a)*int(c)
if ((a + b + c) == 0):
    x1 = 1
    x2 = c / a
    print ("Program has 2 values: x1 = %s x2 = %s" %(x1, x2))
elif ((a - b + c) == 0):
    x1 = - 1
    x2 = - c / a
    print ("Program has 2 values: x1 = %s, x2 = %s" %(x1, x2))
elif d < 0:
    print("Program does not have the value")
elif d == 0:
    print("Program have a value: ", -b/(2*a))
else:
    x1 = (-b + math.sqrt(d)) / (2*a)
    x2 = (-b - math.sqrt(d)) / (2*a)
    print("program has 2 values: x1 = %s x2 = %s" %(x1, x2))