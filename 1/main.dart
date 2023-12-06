import 'dart:convert';

const exampleInput = """1abc2
pqr3stu8vwx
a1b2c3d4e5f
treb7uchet""";

bool isNumber(int element) => element >= 48 && element <= 57;

int getNumbers(String input) {
  List<int> firstNum = [];
  firstNum.add(input.codeUnits.firstWhere((element) => isNumber(element)));
  firstNum.add(input.codeUnits.lastWhere((element) => isNumber(element)));
  return int.parse(Utf8Decoder().convert(firstNum));
}

main() {
  int result = 0;
  exampleInput.split('\n').forEach((element) {
    result += getNumbers(element);
  });
  print(result);
}
