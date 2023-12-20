import 'dart:io';

bool isNumber(int element) => element >= 48 && element <= 57;

List<String> extractColors(String input, int gameID) {
  input = input.replaceAll('Game $gameID: ', '');
  input = input.replaceAll(';', ',');
  final newInput = input.split(',');
  return newInput;
}

bool sumOfColors(List<String> inputList) {
  int red = 0, green = 0, blue = 0;
  for (int i = 0; i < inputList.length; i++) {
    final numEndsAt = inputList
        .elementAt(i)
        .codeUnits
        .lastIndexWhere((element) => isNumber(element));
    final cubesNum =
        int.parse(inputList.elementAt(i).substring(0, numEndsAt + 1));
    final cubesColor = inputList
        .elementAt(i)
        .substring(numEndsAt + 2, inputList.elementAt(i).length);

    switch (cubesColor.trim()) {
      case 'red':
        red += cubesNum;
        break;
      case 'green':
        green += cubesNum;
        break;
      case 'blue':
        blue += cubesNum;
        break;
      default:
    }
  }

  final bResult = checkGame(red, green, blue);
  print('red $red green $green blue $blue $bResult');
  // print(checkGame(red, green, blue));
  return bResult;
}

bool checkGame(int red, int green, int blue) =>
    red <= 12 && green <= 13 && blue <= 14;

main() async {
  int result = 0;
  int gameID = 0;
  final inputFile = await File('2/input.txt').readAsString();

  inputFile.split('\n').forEach((element) {
    result++;
    final extractedListOfColors = extractColors(element, result);
    if (sumOfColors(extractedListOfColors))
      gameID += result; // Fix here, add gameID, not result
  });

  print('$gameID $result');
}
