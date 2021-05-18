void test(void Function(int) action) {
  final data = [1, 3, 5, 7, 9, 2, 4, 6, 8, 10];

  for (final item in data) {
    action(item);
  }
}

void main() {
  test(
      // anonymous function
      (int value) {
    print("Number: $value ");
  });
}
