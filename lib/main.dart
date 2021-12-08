import 'package:flutter/material.dart';
import 'Questack.dart';

void main() {
  runApp(const Quizller());
}

Questack q1= Questack();

class Quizller extends StatelessWidget {



  const Quizller({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: const SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Quizapp(),
          ),
        ),
      ),
    );
  }
}

class Quizapp extends StatefulWidget {
  const Quizapp({Key? key}) : super(key: key);


  @override
  _QuizappState createState() => _QuizappState();
}

class _QuizappState extends State<Quizapp> {

  List<Icon> score = [];

  void check(bool clickedans)
  {
    bool currectans = q1.getans();

    setState(() {
      if(clickedans == currectans)
      {
        score.add(const Icon(Icons.check,color: Colors.green,));
      }
      else
      {
        score.add(const Icon(Icons.close,color:Colors.red));
      }

      q1.getnextque();
    });
  }

  //List<String> question = [
  //  'You can lead a cow down stairs but not up stairs.',
  //  'Approximately one quarter of human bones are in the feet.',
  //  'A slug\'s blood is green.'
  //];

  //List<bool> ans = [false,true,true];

  //Question q = Question();

  //List<Question> bank = [
  //  Question(q: 'You can lead a cow down stairs but not up stairs.', a: false),
  //  Question(q: 'Approximately one quarter of human bones are in the feet.', a: true),
  //  Question(q: 'A slug\'s blood is green.', a: true),
  //];



  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                q1.getQue(),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: FlatButton(
              textColor: Colors.white,
              color: Colors.green,
              child: const Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                check(true);
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: FlatButton(
              color: Colors.red,
              child: const Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                check(false);
              },
            ),
          ),
        ),
        Row(
          children: score,
        )
      ],
    );
  }
}
