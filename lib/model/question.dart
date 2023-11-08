class Question {
  int id;
  String question;
  List<int> answers;
  int correctAnswer;

  Question({
    required this.id,
    required this.question,
    required this.answers,
    required this.correctAnswer,
  });
}
