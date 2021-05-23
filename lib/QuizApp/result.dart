import 'package:flutter/material.dart';
class Result extends StatelessWidget {
final int resultScore;
final Function restartQuiz;

Result(this.resultScore,this.restartQuiz);

String get resultPhrase{
  var resultPhrase;
  if(resultScore<12){
    resultPhrase='$resultScore You have to do better next time :/';
  }else {
    resultPhrase=' $resultScore Great score !!!';
  }
  return resultPhrase;
}
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
              resultPhrase,
            style: TextStyle(
              color: Colors.grey[700],
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          TextButton(onPressed: restartQuiz, child:
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
                'Restart Quiz!!',
              style: TextStyle(
                backgroundColor: Colors.green[200],
                color: Colors.grey[800],
                fontSize: 16,
              ),
            ),
          ),
          )
        ],
      ),
    );
  }
}
