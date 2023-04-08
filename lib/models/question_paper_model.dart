import 'package:elte_learn/packages_barrel/packages_barrel.dart';

class QuestionPaperModel {
  String id;
  String title;
  String imageTitle;
  String? imageUrl;
  String description;
  int timeSeconds;
  List<Questions>? questions;
  int questionsCount;

  QuestionPaperModel({
    required this.id,
    required this.title,
    required this.imageTitle,
    this.imageUrl,
    required this.description,
    required this.timeSeconds,
    this.questions,
    required this.questionsCount,
  });

  QuestionPaperModel.fromJson(Map<String, dynamic> json)
      : id = json['id'] as String,
        title = json['title'] as String,
        imageTitle = json['image_title'] as String,
        imageUrl = json['image_url'] as String,
        description = json['description'] as String,
        timeSeconds = json['time_seconds'],
        questions = (json['questions'] as List).map((dynamic e) => Questions.fromJson(e as Map<String, dynamic>)).toList(),
        questionsCount = 0;

  QuestionPaperModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> json)
      : id = json.id,
        title = json['title'],
        imageTitle = json['image_title'],
        imageUrl = json['image_url'],
        description = json['description'],
        timeSeconds = json['time_seconds'],
        questions = [],
        questionsCount = json['questions_count'] as int;

  String timeInMinutes() => "${(timeSeconds / 60).ceil()}";
}

class Questions {
  String id;
  String question;
  List<Answers> answers;
  String? correctAnswer;
  String? selectedAnswer;

  Questions({required this.id, required this.question, required this.answers, this.correctAnswer});

  Questions.fromSnapshot(QueryDocumentSnapshot<Map<String, dynamic>> snapshot)
      : id = snapshot.id,
        question = snapshot['question'],
        answers = [],
        correctAnswer = snapshot['correct_answer'];

  Questions.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        question = json['question'],
        answers = (json['answers'] as List).map((e) => Answers.fromJson(e)).toList(),
        correctAnswer = json['correct_answer'];
}

class Answers {
  String? identifier;
  String? answer;

  Answers({this.identifier, this.answer});

  Answers.fromJson(Map<String, dynamic> json)
      : identifier = json['identifier'],
        answer = json['answer'];

  Answers.fromSnapshot(QueryDocumentSnapshot<Map<String, dynamic>> snapshot)
      : identifier = snapshot['identifier'] as String?,
        answer = snapshot['answer'] as String?;
}
