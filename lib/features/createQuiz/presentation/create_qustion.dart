import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/core/db/sqldb.dart';
import 'package:quiz_app/features/createQuiz/presentation/create_quiz.dart';
import 'package:quiz_app/features/createQuiz/presentation/widgets/default_form_field.dart';
import 'package:quiz_app/features/home/widgets/default_button..dart';

class CreateQustionPage extends StatefulWidget {
  const CreateQustionPage({Key? key}) : super(key: key);

  @override
  State<CreateQustionPage> createState() => _CreateQustionPageState();
}

class _CreateQustionPageState extends State<CreateQustionPage> {
  TextEditingController qustionController = TextEditingController();
  TextEditingController answer1Controller = TextEditingController();
  TextEditingController answer2Controller = TextEditingController();
  TextEditingController answer3Controller = TextEditingController();
  TextEditingController answer4Controller = TextEditingController();

  final List<String> items = [
    '1',
    '2',
    '3',
    '4',
  ];
  String selectedValue = '1';
  SqlDb sqlDb = SqlDb();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add new question'),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: ListView(
          children: [
            CustomTextFormFiled(
              lable: "question",
              controller: qustionController,
              hint: "Question",
            ),
            Row(
              children: [
                const CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.green,
                  child: Text(
                    "1",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.white),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                    child: CustomTextFormFiled(
                  lable: "answer1",
                  controller: answer1Controller,
                  hint: "First Answer",
                ))
              ],
            ),
            Row(
              children: [
                const CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.green,
                  child: Text(
                    "2",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.white),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                    child: CustomTextFormFiled(
                  lable: "answer2",
                  controller: answer2Controller,
                  hint: "Second Answer",
                ))
              ],
            ),
            Row(
              children: [
                const CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.green,
                  child: Text(
                    "3",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.white),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                    child: CustomTextFormFiled(
                  lable: "answer3",
                  controller: answer3Controller,
                  hint: "Third Answer",
                ))
              ],
            ),
            Row(
              children: [
                const CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.green,
                  child: Text(
                    "4",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.white),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                    child: CustomTextFormFiled(
                  lable: "answer4",
                  controller: answer4Controller,
                  hint: "Fourth Answer",
                ))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Select the correct answer',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                ),
                SizedBox(
                  width: 40,
                  child: DropdownButton<String>(
                    value: selectedValue,
                    items: items
                        .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedValue = value.toString();
                        print(selectedValue);
                      });
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            DefaultButton(
              text: "Add Question",
              onTap: () async {
                var response = await sqlDb.insertData(
                    "INSERT INTO 'quiz' ('qustion','answer1','answer2','answer3','answer4','true_answer') VALUES ('${qustionController.text}','${answer1Controller.text}','${answer2Controller.text}','${answer3Controller.text}','${answer4Controller.text}','${int.parse(selectedValue)}')");
                 Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const CreateQuiz(),),);
                print(response);
              },
            ),
          ],
        ),
      ),
    );
  }
}
