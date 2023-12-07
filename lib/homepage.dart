import 'package:flutter/material.dart';
import 'package:newapp/question_model.dart';
import 'package:newapp/questions_list.dart';
import 'package:newapp/resultpage.dart';


class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  Color secondcolor = Color(0xFF117eeb);
  PageController? _controller = PageController(initialPage: 0);
  bool isPressed = false;
  Color isTrue = Colors.green;
  Color isWrong = Colors.red;
  Color btncolor = const Color.fromARGB(255, 193, 164, 34);
  int score = 0;

  @override
  void initState() {
    super.initState();
    shuffledQuestions = List.from(shuffledQuestions)..shuffle();
  }

  @override
  Widget build(BuildContext context) {

    int numOfQuestions = 10; 
    List<QuestionModel> displayedQuestions =
        shuffledQuestions.sublist(0, numOfQuestions);

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 195, 211, 88),
      body: Padding(
        padding: EdgeInsets.all(18.0),
        child: PageView.builder(
          physics: const NeverScrollableScrollPhysics(),
          controller: _controller,
          onPageChanged: (Page) {
            setState(() {
              isPressed = false;
            });
          },
          itemCount: displayedQuestions.length,
          itemBuilder: (context, index) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Text(
                    'Question ${index + 1}/${displayedQuestions.length}',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w300,
                        fontSize: 28),
                  ),
                ),
                Divider(
                  color: Colors.black,
                  height: 8.0,
                  thickness: 1.0,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(displayedQuestions[index].question!,
                    style: TextStyle(color: Colors.black, fontSize: 26)),
                SizedBox(height: 35),
                for (int i = 0; i < displayedQuestions[index].answer!.length; i++)
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.only(bottom: 18.0),
                    child: MaterialButton(
                      shape: StadiumBorder(),
                      color: isPressed
                          ? displayedQuestions[index].answer!.entries.toList()[i].value
                              ? isTrue
                              : isWrong
                          : btncolor,
                      padding: EdgeInsets.symmetric(vertical: 18.0),
                      onPressed: isPressed
                          ? () {}
                          : () {
                              setState(() {
                                isPressed = true;
                              });
                              if (displayedQuestions[index]
                                  .answer!
                                  .entries
                                  .toList()[i]
                                  .value) {
                                score += 10;
                                print(score);
                              }
                            },
                      child: Text(
                        displayedQuestions[index].answer!.keys.toList()[i],
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                SizedBox(
                  height: 30.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    OutlinedButton(
                        onPressed: isPressed
                            ? index + 1 == displayedQuestions.length
                                ? () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: ((context) =>
                                                resultpage(score))));
                                  }
                                : () {
                                    _controller!.nextPage(
                                        duration: Duration(milliseconds: 500),
                                        curve: Curves.linear);
                                  }
                            : null,
                        style: ButtonStyle(),
                        child: Text(
                          index + 1 == displayedQuestions.length
                              ? 'See result'
                              : 'Next question',
                          style: TextStyle(color: Colors.black),
                        )),
                  ],
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
