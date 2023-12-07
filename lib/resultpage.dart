import 'package:flutter/material.dart';
import 'package:newapp/homepage.dart';

class resultpage extends StatefulWidget {
  final int score;
  const resultpage(this.score, {super.key});

  @override
  State<resultpage> createState() => _resultpageState();
}

class _resultpageState extends State<resultpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 195, 211, 88),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Congratulations',
              style: TextStyle(
                  fontSize: 35,
                  color: Color.fromARGB(255, 45, 44, 44),
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              'Your score is :',
              style: TextStyle(
                  fontSize: 25,
                  color: const Color.fromARGB(255, 45, 44, 44),
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              '${widget.score}',
              style: TextStyle(
                  fontSize: 60,
                  color: Color.fromARGB(255, 153, 16, 16),
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 60,
            ),
            MaterialButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: ((context) => homepage())));
              },
              color: Color.fromARGB(255, 153, 16, 16),
              child: Text(
                'Repeat the quizz',
                style: TextStyle(fontSize: 15, color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
