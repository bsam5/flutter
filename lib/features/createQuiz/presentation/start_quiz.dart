import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/core/db/sqldb.dart';
import 'package:quiz_app/core/models/qustion_model.dart';
import 'package:quiz_app/features/createQuiz/presentation/error_page.dart';
import 'package:quiz_app/features/createQuiz/presentation/fail_screen.dart';
import 'package:quiz_app/features/createQuiz/presentation/result_screen.dart';
import 'package:quiz_app/features/createQuiz/presentation/widgets/answer.dart';
import 'package:quiz_app/features/createQuiz/presentation/widgets/answer_widget.dart';
import 'package:quiz_app/features/home/widgets/default_button..dart';

class StartQuiz extends StatefulWidget {
  const StartQuiz({Key? key}) : super(key: key);

  @override
  State<StartQuiz> createState() => _StartQuizState();
}

class _StartQuizState extends State<StartQuiz> {
  SqlDb sqlDb = SqlDb();

  Future<List<Map>> readData() async {
    List<Map> res = await sqlDb.readData("SELECT * FROM 'quiz'");
    return res;
  }

  int currentIndex = 0;
  int score = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz App'),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Container(
        child: Column(
          children: [
            FutureBuilder(
              future: readData(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<Question> list = [];
                  for (var i = 0; i < snapshot.data!.length; i++) {
                    QustionModel model =
                        QustionModel.fromMap(snapshot.data![i]);
                    list.add(Question(
                        model.qustion!,
                        [
                          Answer(model.answer1!),
                          Answer(model.answer2!),
                          Answer(model.answer3!),
                          Answer(model.answer4!),
                        ],
                        model.trueAnswer!));
                  }
                  if(list.length>4){
                    return Container(
                      padding: const EdgeInsets.only(
                          left: 20, right: 20, bottom: 20, top: 200),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Question ${currentIndex + 1}",
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Colors.green),
                              ),
                              Text(
                                "/ ${list.length}",
                                textAlign: TextAlign.justify,
                                style: const TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          DefaultButton(
                            text: list[currentIndex].question,
                            width: double.infinity,
                          ),
                          ...list[currentIndex]
                              .answerList
                              .asMap()
                              .entries
                              .map((e) => Container(
                              margin: const EdgeInsets.only(top: 15),
                              child: AnswerQuizButton(
                                text: e.value.answer,
                                width: double.infinity,
                                onTap: () {
                                  if (e.key + 1 ==
                                      list[currentIndex].trueAnswer) {
                                    score++;
                                  }
                                  if (currentIndex == list.length - 1) {
                                    if(score>=list.length/2){
                                      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => SuccessScreen(score: score,length: list.length,),));
                                    }else{
                                      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => FailScreen(score: score,length: list.length,),));
                                    }
                                  } else {
                                    setState(() {
                                      currentIndex++;
                                    });
                                  }
                                },
                              ))),
                        ],
                      ),
                    );
                  }else{
                    return ErrorPage();
                  }


                } else {
                  return const CircularProgressIndicator();
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
