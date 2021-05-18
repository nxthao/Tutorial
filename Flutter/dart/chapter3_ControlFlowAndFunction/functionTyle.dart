bool checkEven(int value) => value % 2 == 0;

void main() {
  bool Function(int) checker = checkEven;
  print(checker(8));
  print(checker(7));
}
