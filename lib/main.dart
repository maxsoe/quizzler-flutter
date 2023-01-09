import 'package:flutter/material.dart';
import 'quiz_brain.dart';

QuizBrain quizBrain = QuizBrain();

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

  int index = 0;

  @override
  Widget build(BuildContext context) {
    index = quizBrain.getIndex();
    debugPrint('index is now $index');
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
                'Q$index: ${quizBrain.getQuestion(index)}',
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
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                debugPrint(
                    'True clicked - q$index is ${quizBrain.getAnswer(index)}');

                bool correctAnswer = quizBrain.getAnswer(index);

                if (correctAnswer) {
                  debugPrint('Correct - Tick added');
                  setState(() {
                    scoreKeeper.add(Icon(
                      Icons.check,
                      color: Colors.green,
                    ));
                    quizBrain.nextQuestion();
                  });
                } else {
                  debugPrint('Incorrect answer - Cross added');
                  setState(() {
                    scoreKeeper.add(Icon(
                      Icons.close,
                      color: Colors.red,
                    ));
                    quizBrain.nextQuestion();
                  });
                }

                // if (index < quizBrain.getLength() - 1) {
                //   setState(() {
                //     index++;
                //     debugPrint('index increased to $index');
                //   });
                // } else {
                //   setState(() {
                //     index = 0;
                //     debugPrint('index reset to $index');
                //   });
                // }
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
                    'False clicked - q$index is ${quizBrain.getAnswer(index)}.');
                bool correctAnswer = quizBrain.getAnswer(index);
                if (correctAnswer == false) {
                  debugPrint('Correct - Tick added');
                  setState(() {
                    scoreKeeper.add(Icon(
                      Icons.check,
                      color: Colors.green,
                    ));
                    quizBrain.nextQuestion();
                  });
                } else {
                  debugPrint('Incorrect answer - Cross added');
                  setState(() {
                    scoreKeeper.add(Icon(
                      Icons.close,
                      color: Colors.red,
                    ));
                    quizBrain.nextQuestion();
                  });
                }

                // if (index < quizBrain.getLength() - 1) {
                //   setState(() {
                //     index++;
                //     debugPrint('index increased to $index');
                //   });
                // } else {
                //   setState(() {
                //     index = 0;
                //     debugPrint('index reset to $index');
                //   });
                // }
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
