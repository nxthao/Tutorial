# Solution 1:
n = int(input())
arr = list(map(int, input().split()))

def sort(arr, n):
    for i in range(0, n):
        for j in range(i, n):
            if arr[i] < arr[j]:
                tmp = arr[i]
                arr[i] = arr[j]
                arr[j] = tmp

def runnerUp(arr, n):
    for i in range(1, n):
        if (arr[i] < arr[0]):
            return arr[i]

sort(arr, n)
runnerUpPeople = runnerUp(arr, n)
print(runnerUpPeople)


# Solution2:
n = int(input())
arr = list(map(int, input().split()))

def runnerUp(arr, n):
    for i in range(1, n):
        if (arr[i] < arr[0]):
            return arr[i]

arr.sort(reverse = True)
runnerUpPeople = runnerUp(arr, n)
print(runnerUpPeople)

# Solution3:
n = int(input())
arr = list(map(int, input().split()))

maxArr = max(arr)

def runnerUp(arr, n, maxArr):
    for i in range(0, n):
        if (maxArr == max(arr)):
            arr.remove(max(arr))

    return max(arr)

runnerUpPeople = runnerUp(arr, n, maxArr)
print(runnerUpPeople)

