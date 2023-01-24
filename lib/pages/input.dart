import "dart:io";

main() {
  int n;
  print("Enter a number");
  String? inTemp = stdin.readLineSync();

  n = int.parse(inTemp!);

  return n;
}
