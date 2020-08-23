import 'dart:async';

import 'package:flutter/material.dart';
import 'package:quiz_app/model/question.dart';


class QuizApp extends StatefulWidget {
  @override
  _QuizAppState createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {


  int _currentQuestionIndex = 0;


  List questionBank = [
    Question.name("Winter Soldier has a Vibranium arm", true),
    Question.name("Captain America's shield is made from Adamantium", false),
    Question.name("Wasp's Real Name is Hope Van Dyne", true),
    Question.name("Doctor Strange protected the Reality stone", false),
    Question.name("Captain Marvel got her powers from the Space Stone", true),
    Question.name("There are two infinity gauntlets", false),
    Question.name("MCU stands for Marvel Cinematic Universe", true),
    Question.name("Does Thor own a Mjolnir", true),
    Question.name("In the MCU films, does the big bad Thanos collected all the infinity stones"
        , true),
    Question.name("The Super Soldier Serum used on Steve Rogers was recreated", true),
    Question.name("Was Gamora a member of the Black Order ", false),
    Question.name("Was Dormammu slated to appear in Avengers: Endgame", true),
    Question.name("Rocket Raccoon Has Been Genetically And Cybernetically Altered", true),
    Question.name("Was Guardians of the Galaxy was based on a comic book", true),


  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MARVEL"),
        centerTitle: true,
        // backgroundColor: Colors.blueGrey,
      ),

      // backgroundColor: Colors.blueGrey,

      // We use [Builder] here to use a [context] that is a descendant of [Scaffold]
      //or else [Scaffold.of] will return null
      body: Builder(
        builder: (BuildContext context) => Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Center(
                child: Image.asset(
                  "images/logo.png",
                  width: 250,
                  height: 180,
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(14.4),
                      border: Border.all(
                          color: Colors.blueGrey.shade400,
                          style: BorderStyle.solid)),
                  height: 120.0,
                  child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          questionBank[_currentQuestionIndex].questionText,
//                      style: TextStyle(fontSize: 16.9,
//                          color: Colors.white),
                        ),
                      )),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  RaisedButton(
                    onPressed: () => _prevQuestion(),
                    color: Colors.blueGrey.shade900,
                    child: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                  ),
                  RaisedButton(
                    onPressed: () => _checkAnswer(true, context),
                    color: Colors.blueGrey.shade900,
                    child: Text(
                      "TRUE",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  RaisedButton(
                    onPressed: () => _checkAnswer(false, context),
                    color: Colors.blueGrey.shade900,
                    child: Text(
                      "FALSE",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  RaisedButton(
                    onPressed: () => _nextQuestion(),
                    color: Colors.blueGrey.shade900,
                    child: Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }

  _prevQuestion() {
    setState(() {
      _currentQuestionIndex = (_currentQuestionIndex - 1) % questionBank.length;
      debugPrint("Index: $_currentQuestionIndex");
    });
  }

  _checkAnswer(bool userChoice, BuildContext context) {
    if (userChoice == questionBank[_currentQuestionIndex].isCorrect) {
      //correct answer
      final snackbar = SnackBar(
          backgroundColor: Colors.green,
          duration: Duration(milliseconds: 500),
          content: Text("Correct!"));
      Scaffold.of(context).showSnackBar(snackbar);
      _updateQuestion();
    } else {
      debugPrint("Incorrect!");
      final snackbar = SnackBar(
          backgroundColor: Colors.redAccent,
          duration: Duration(milliseconds: 500),
          content: Text("Incorrect!"));
      Scaffold.of(context).showSnackBar(snackbar);

      _updateQuestion();
    }
  }

  _updateQuestion() {
    setState(() {
      _currentQuestionIndex = (_currentQuestionIndex + 1) % questionBank.length;
    });
  }

  _nextQuestion() {
    _updateQuestion();
  }
}