class SupportFunction {
  static int getFirstNumber(String indexString) {
    if (indexString.contains('-')) {
      return int.parse(indexString.split('-')[0]);
    } else {
      return int.parse(indexString);
    }
  }

  static int getLastNumber(String indexString) {
    if (indexString.contains('-')) {
      return int.parse(indexString.split('-')[1]);
    } else {
      return int.parse(indexString);
    }
  }

  static int getLengthQuestionList(String firstIndex, String lastIndex) {
    int firstNumber = getFirstNumber(firstIndex);
    int lastNumber = getLastNumber(lastIndex);
    return lastNumber - firstNumber + 1;
  }

  static int convertAnswerToInt(String answerString) {
    switch (answerString) {
      case "A":
        return 0;
      case "B":
        return 1;
      case "C":
        return 2;
      case "D":
        return 3;
      default:
        return -1;
    }
  }

  static int roundNumberTo5(double number) {
    int result = number.round();
    int mod = result % 5;
    if (mod < 3)
      result -= mod;
    else
      result += (5 - mod);
    return result;
  }

  static int toMinutes(int second) {
    return (second / 60).round();
  }
}
