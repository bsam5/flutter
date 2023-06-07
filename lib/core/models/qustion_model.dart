class QustionModel {
  int?id;
  String? qustion;
  String? answer1;
  String? answer2;
  String? answer3;
  String? answer4;
  int? trueAnswer;

  QustionModel(this.qustion, this.answer1, this.answer2, this.answer3,
      this.answer4, this.trueAnswer,this.id);

  QustionModel.fromMap(Map<dynamic, dynamic> map) {
    id=map['id'];
    qustion = map['qustion'];
    answer1 = map['answer1'];
    answer2 = map['answer2'];
    answer3 = map['answer3'];
    answer4 = map['answer4'];
    trueAnswer = map['true_answer'];
  }
}
class Question{
  final String question;
  final List<Answer> answerList;
  final int trueAnswer;

  Question(this.question, this.answerList, this.trueAnswer);
}
class Answer{
  final String answer;

  Answer(this.answer);
}
