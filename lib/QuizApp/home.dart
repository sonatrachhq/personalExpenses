import 'package:flutter/material.dart';
import 'package:flutter_app/QuizApp/answer.dart';
import 'package:flutter_app/QuizApp/question.dart';
import 'package:flutter_app/QuizApp/quiz.dart';
import 'package:flutter_app/QuizApp/result.dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var _questionIndex = 0;
  var totalScore=0;
  static const questions = [
    {
      'questionText': 'What\'s your favorite color?',
      'answers': [
        {'text':'Green','score':10},
        {'text':'Black','score':3},
        {'text':'Blue','score':7},
        {'text':'Red','score':5}
        ]
    },
    {
      'questionText': 'What\'s your favorite animal?',
      'answers': [
        {'text':'Dog','score':10},
        {'text':'Cat','score':3},
        {'text':'Fish','score':7},
        {'text':'Rabbit','score':5}
        ]
    },
    {
      'questionText': 'What\'s your favorite flower?',
      'answers': [
        {'text':'tulip','score':10},
        {'text':'rose','score':3},
        {'text':'sunflower','score':7},
        ]
    },
  ];

  void _answerQuestion(int score) {
    totalScore +=score;
    setState(() {
      _questionIndex++;
    });

  }
void _restartQuiz(){
  setState(() {
    _questionIndex=0;
    totalScore=0;
  });

}
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[800],
        title: Text('Quiz Application'),
      ),
      body: _questionIndex<questions.length? Quiz(
        answerQuestion: _answerQuestion,
        questions: questions,
        questionIndex: _questionIndex,
      )
      :Result(totalScore,_restartQuiz)
    );
  }
}
