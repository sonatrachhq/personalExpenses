import 'package:flutter/material.dart';
class Answer extends StatelessWidget {
  final Function selectedHandler;
  final String answerText;
  Answer(this.selectedHandler,this.answerText);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(

        onPressed: selectedHandler,
        child: Text(answerText),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.green),

        ),
      ),
    );

  }
}
