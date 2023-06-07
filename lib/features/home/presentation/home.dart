import 'package:flutter/material.dart';
import 'package:quiz_app/core/cach_helper.dart';
import 'package:quiz_app/core/models/user_model.dart';
import 'package:quiz_app/features/auth/views/login.dart';
import 'package:quiz_app/features/createQuiz/presentation/create_quiz.dart';
import 'package:quiz_app/features/createQuiz/presentation/start_quiz.dart';
import 'package:quiz_app/features/home/widgets/default_button..dart';

import '../../../core/db/sqldb.dart';
import '../../../core/models/qustion_model.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  SqlDb sqlDb = SqlDb();
    UserModel userModel=UserModel(1, "test", "test");

  Future<List<Map>> readUserData() async {
    var userid=await CacheHelper.getData(key: "userId");
    List<Map> res = await sqlDb.readData("SELECT * FROM 'user' WHERE id = '$userid'");
    setState(() {
      userModel= UserModel.fromMao(res[0]);
    });

    return res;
  }

  @override
  void initState() {
    readUserData();
    super.initState();


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('quiz app'),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      drawer: Drawer(
          child: ListView(
        children:  [
          Container(
            height: MediaQuery.of(context).size.width*0.5,
            color: Colors.greenAccent,
            padding: EdgeInsets.only(left: 10,top: 30),
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CircleAvatar(
                     child: Text(userModel.name![0].toUpperCase(),style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold
                    ),),
                    radius: 35,
                  ),
                  const SizedBox(height: 10,),
                  Text(userModel.name!,style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17
                  ),),
                  SizedBox(height: 10,),
                  Text(userModel.email!,style:const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17
                  ),)
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) =>const CreateQuiz() ,));
            },
            child: const ListTile(
              leading: Icon(Icons.edit),
              title: Text('create quiz'),
            ),
          ),
           GestureDetector(
             onTap: () {
               Navigator.of(context).push(MaterialPageRoute(builder: (context) =>const StartQuiz() ,));
             },
             child: ListTile(
              leading: Icon(Icons.quiz),
              title: Text('start quiz'),
          ),
           ),
          Container(width: double.infinity,height: 1,color: Colors.grey,),
          GestureDetector(
            onTap: () async{
              await CacheHelper.removeData(key: "userId");
              Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => Login_screen(),), (route) => false);
            },
            child: const ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('Exit'),
            ),
          )
        ],
      )),
      body: Container(
        margin: const EdgeInsets.only(top:50),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            Center(
              child: Column(
                children:  [
                  const Image(image: AssetImage('assets/images/quiz.png')),
                  DefaultButton(text: "lets started",onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) =>StartQuiz(),));
                  },),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
