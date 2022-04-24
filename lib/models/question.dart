// ignore_for_file: prefer_initializing_formals

class Question {
  late String audioUrl;
  late String imageUrl;
  late String A;
  late String B;
  late String C;
  late String D;
  late String correctAnswer;
  Question(
      {required String allAnswer,
      required String correctAnswer,
      required String audioUrl,
      required String imageUrl}) {
    // ignore: prefer_initializing_formals
    List<String> splitAnswer = allAnswer.split('\n');
    for (var i = 0; i < splitAnswer.length; i++) {
      splitAnswer[i] = splitAnswer[i].substring(4);
    }
    A = splitAnswer[0];
    B = splitAnswer[1];
    C = splitAnswer[2];
    D = splitAnswer[3];
    this.correctAnswer = correctAnswer;
    this.audioUrl = audioUrl;
    this.imageUrl = imageUrl;
  }
  Map<String, dynamic> toJson() => {
        'A': A,
        'B': B,
        'C': C,
        'D': D,
        'correctAnswer': correctAnswer,
        'audioUrl': audioUrl,
        'imageUrl': imageUrl
      };
  void printOut() {
    super.toString();
    print("A:$A\nB:$B\nC:$C\nD:$D\ncorrectAnswer: $correctAnswer");
  }
}
