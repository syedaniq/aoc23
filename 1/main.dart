import 'dart:convert';
import 'dart:io';

bool isNumber(int element) => element >= 48 && element <= 57;

int getNumbers(String input) {
  List<int> firstNum = [];
  firstNum.add(input.codeUnits.firstWhere((element) => isNumber(element)));
  firstNum.add(input.codeUnits.lastWhere((element) => isNumber(element)));
  return int.parse(Utf8Decoder().convert(firstNum));
}

main() async {
  int result = 0;
  final inputFile = await File('1/input.txt').readAsString();

  inputFile.split('\n').forEach((element) {
    result += getNumbers(element);
  });

  print(result);
}
