void main(List<String> arguments) {
  print('Hello world!');
  String stringNumbers = "2 4 6 8 10";
  final intNumbers = stringNumbers.split(" ").map(int.tryParse).toList();
  int c = intNumbers[1];
  print(intNumbers);
  print(c);
}
