import 'package:flutter/material.dart';
import 'package:flutter_app/QuizApp/question.dart';
import 'package:flutter_app/QuizApp/answer.dart';
class Quiz extends StatelessWidget {
final Function answerQuestion;
final int questionIndex;
final List <Map<String,Object>> questions;


Quiz({
@required this.answerQuestion,
@required this.questions,
@required this.questionIndex});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(
          questions[questionIndex]['questionText'],
        ),
        ...(questions[questionIndex]['answers'] as List<Map<String,Object>>)
            .map((answer) {
          return Answer(()=>answerQuestion(answer['score']), answer['text']);
        }).toList(),
      ],
    );
  }
}
