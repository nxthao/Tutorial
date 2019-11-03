class Employee:
    count = 0 # Class variable
    def __init__(self, name, id):
        self.name = name # Instant variable
        self.__id = id # private variable
        Employee.count += 1

    def displayEmployee(self):
        print("Name: %s .ID: %s" % (self.name, self.__id))

emp1 = Employee("Thao", 1)
emp1.displayEmployee()
print("Name of first employee: ", emp1.name)
# print("Id of first employee: ", emp1.__id) # because __id is private variable, so I can not access from outside
emp2 = Employee("Nguyen", 2)
emp2.displayEmployee()
print("Total: ", Employee.count)