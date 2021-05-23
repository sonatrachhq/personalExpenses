import 'package:flutter/material.dart';
import 'package:flutter_app/QuizApp/home.dart';

void main() => runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    routes: {
      '/': (context) => Home(),
      /*'/home': (context) => Home(),
      '/location': (context) => ChooseLocation(),*/
    },
  theme: ThemeData(
    primarySwatch: Colors.purple,
    accentColor: Colors.amber,
    fontFamily: 'Lato',
    textTheme: ThemeData.light().textTheme.copyWith(
      headline6: TextStyle(
          fontFamily: 'Lato',
          fontWeight: FontWeight.bold,
          fontSize: 14,
          color: Colors.purple,
      ),
      button: TextStyle(
        color: Colors.white,
        fontSize: 16,
      ),
    )
  ),
));
