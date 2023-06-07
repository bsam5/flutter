import 'package:flutter/material.dart';
import 'package:quiz_app/core/models/qustion_model.dart';
import 'package:quiz_app/features/createQuiz/presentation/create_qustion.dart';
import 'package:quiz_app/features/createQuiz/presentation/widgets/answer_widget.dart';
import 'package:quiz_app/features/home/widgets/default_button..dart';

import '../../../core/db/sqldb.dart';
class CreateQuiz extends StatefulWidget {
  const CreateQuiz({Key? key}) : super(key: key);

  @override
  State<CreateQuiz> createState() => _CreateQuizState();

}


class _CreateQuizState extends State<CreateQuiz> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      readData();
    });

  }
  SqlDb sqlDb = SqlDb();

  Future<List<Map>> readData() async {
    List<Map> res = await sqlDb.readData("SELECT * FROM 'quiz'");
    return res;
  }

  @override
  Widget build(BuildContext context) {

return Scaffold(
  appBar: AppBar(
    title: const Text("Create quiz"),
    centerTitle: true,
    backgroundColor: Colors.green,
  ),
  body: Flex(
    direction: Axis.vertical,
    children: [
      Flexible(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              DefaultButton(
                text: "+ Add Qustion",
                width: double.infinity,
                onTap: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => const CreateQustionPage(),
                  ));
                },
              ),

              Expanded(
                child: FutureBuilder(
                  future: readData(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          QustionModel qustion =
                          QustionModel.fromMap(snapshot.data![index]);
                          List<String> answers = [
                            qustion.answer1!,
                            qustion.answer2!,
                            qustion.answer3!,
                            qustion.answer4!
                          ];
                          return Container(
                            height: 300,
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(16),
                            ),
                            margin: const EdgeInsets.only(top: 20),
                            child: Padding(
                              padding: const EdgeInsets.all(20),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        '${qustion.qustion}',
                                        style: const TextStyle(
                                          fontSize: 20,
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () async{
                                          var res=await sqlDb.deleteData("DELETE FROM 'quiz' WHERE id=${qustion.id}");
                                          setState(() {
                                          });
                                        },
                                        child: const Icon(
                                          Icons.delete,
                                          color: Colors.grey,
                                          size: 30,
                                        ),
                                      ),
                                    ],
                                  ),
                                  ...answers
                                      .asMap()
                                      .entries
                                      .map((answer) => AnswerWidget(
                                    text: "${answer.value}",
                                    answer: answer.key + 1,
                                    trueAnswer:
                                    qustion.trueAnswer!,
                                  ))
                                      .toList()
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    } else {
                      return const CircularProgressIndicator();
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    ],
  ),
);

  }
}
