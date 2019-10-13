dic = {"hello":"xin chao", "love":("verb", "yeu")}
print(dic)

print("Show dictionary: ")
print(dic.items())

print("Show keys: ")
print(dic.keys())

print("Show values: ")
print(dic.values())

print("Show values and key: ")
for key in dic:
    print(key, " : ", dic[key])

print("show value and key from items")
for a in dic.items():
    print(a[0], " : ", a[1])

'''
out put:
{'hello': 'xin chao', 'love': ('verb', 'yeu')}
Show dictionary:
dict_items([('hello', 'xin chao'), ('love', ('verb', 'yeu'))])
Show keys:
dict_keys(['hello', 'love'])
Show values:
dict_values(['xin chao', ('verb', 'yeu')])
Show values and key:
hello  :  xin chao
love  :  ('verb', 'yeu')
show value and key from items
hello  :  xin chao
love  :  ('verb', 'yeu')
'''