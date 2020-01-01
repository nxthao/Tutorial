array = []

def value_runner_up(array):
    for i in range(0, N):
        if array[i][1] > array[0][1]:
            return array[i][1]

def show_runner_up(array, runner_up, N):
    array_ru = []
    for i in range(0, N):
        if array[i][1] == runner_up:
            array_ru.append(array[i])

    print(array_ru)
    array_ru.sort(key=lambda a: a[0])

    for i in range(0, len(array_ru)):
        print(array_ru[i][0])

N = int(input("N: "))
for i in range(0, N):
    name = input("Name: ")
    grade = float(input("Grade: "))
    array.append([name, grade])

print(array)

# sort grade
array.sort(key=lambda a: a[1])
print(array)

runner_up = value_runner_up(array)

print(runner_up)

show_runner_up(array, runner_up, N)


