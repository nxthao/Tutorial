path = "D:\\Learn\\Learn_Python\\test.txt"
with open(path, mode = 'r+') as f:
    print("method 1")
    while True:
        line = f.readline()
        # After above command, pointer is at the end of the file
        if line != "":
            print(line, end="")
        else:
            break

    # Go to new line to use method 2
    print()

    # Move to at the begin of the file
    f.seek(0)

    print ("method 2")
    lines = f.readlines()
    # Readline will read each line
    print(lines)
    for l in lines:
        print(l, end="")

    print()

    print ("Use f.read().split()")

    f.seek(0)

    # Read will read full file
    l = f.read().split()
    print(l)
    for s in l:
        print(s, end="")


    buf = "Learn Python"
    f.write(buf)
