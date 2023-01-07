import 'package:flutter/material.dart';
import 'question.dart';

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scoreKeeper = [];

  List<Question> questionBank = [
    Question(
      q: 'You can lead a cow down stairs but not up stairs.',
      a: false,
    ),
    Question(
      q: 'Approximately one quarter of human bones are in the feet.',
      a: true,
    ),
    Question(
      q: 'A slug\'s blood is green.',
      a: true,
    ),
  ];

  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Wrap(children: scoreKeeper),
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                'Q${index}: ${questionBank[index].questionText}',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Container(
          height: 100,
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.green,
              ),
              // textColor: Colors.white,
              // color: Colors.green,
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                debugPrint(
                    'True clicked - q$index is ${questionBank[index].questionAnswer}.');
                if (questionBank[index].questionAnswer == true) {
                  debugPrint('Tick added');
                  setState(() {
                    scoreKeeper.add(Icon(
                      Icons.check,
                      color: Colors.green,
                    ));
                  });
                } else {
                  debugPrint('Incorrect answer - Cross added');
                  setState(() {
                    scoreKeeper.add(Icon(
                      Icons.close,
                      color: Colors.red,
                    ));
                  });
                }

                if (index < questionBank.length - 1) {
                  setState(() {
                    index++;
                    debugPrint('index increased to $index');
                  });
                } else {
                  setState(() {
                    index = 0;
                    debugPrint('index reset to $index');
                  });
                }
              },
            ),
          ),
        ),
        Container(
          height: 100,
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.red,
              ),
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                debugPrint(
                    'False clicked - q$index is ${questionBank[index].questionAnswer}.');
                if (questionBank[index].questionAnswer == false) {
                  debugPrint('Tick added');
                  setState(() {
                    scoreKeeper.add(Icon(
                      Icons.check,
                      color: Colors.green,
                    ));
                  });
                } else {
                  debugPrint('Incorrect answer - Cross added');
                  setState(() {
                    scoreKeeper.add(Icon(
                      Icons.close,
                      color: Colors.red,
                    ));
                  });
                }

                if (index < questionBank.length - 1) {
                  setState(() {
                    index++;
                    debugPrint('index increased to $index');
                  });
                } else {
                  setState(() {
                    index = 0;
                    debugPrint('index reset to $index');
                  });
                }
              },
            ),
          ),
        ),
      ],
    );
  }
}

/*
question1: 'You can lead a cow down stairs but not up stairs.', false,
question2: 'Approximately one quarter of human bones are in the feet.', true,
question3: 'A slug\'s blood is green.', true,
*/
