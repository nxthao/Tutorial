# calculate factorial
n = 6
if n > 10:
    print ("The value is so high")
elif n == 0:
    print ("the factorial of 0 is 1")
else:
    s = 1
    for i in range (1, n + 1 ):
        s = s * i

    print ("factorial is ", s)