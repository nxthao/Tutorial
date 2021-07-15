void main(List<String> arguments) {
  print('Hello world!');
  List<int> a = [3, 4, 5, 6, 7, 8];
  final index = a.indexWhere((element) => element == 100);
  print(index);
  if (index != -1){
    print(a[index]);
  } else {
    print("not index");
  }
}
