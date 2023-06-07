import 'package:flutter/material.dart';
import 'package:quiz_app/features/home/presentation/home.dart';
import 'package:quiz_app/features/home/widgets/default_button..dart';

class SuccessScreen extends StatelessWidget {
  final int score;
  final int length;
  const SuccessScreen({Key? key, required this.score, required this.length}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Quiz App"),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Container(
          padding:const  EdgeInsets.only(top:200,left: 20,right: 20,bottom: 20),
          child: Column(
            children:  [
             const Text('Congratulations!',style: TextStyle(
               fontSize: 30,
               fontWeight: FontWeight.bold,
               color: Colors.green
             ),),
              const Image(image: AssetImage("assets/images/result.jpg"),width: 260,height: 260,),
              const SizedBox(height: 15,),
              Text("Your Score is : ${score} / ${length}",style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
                color: Colors.greenAccent
              ),),
              const SizedBox(height: 15,),
              const Text("You are super star",style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20
              ),),
              const SizedBox(height: 20,),
              DefaultButton(text: "Back To Home",onTap: () {
                Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => const MyHomePage(),), (route) => false);
              },),


            ],
          ),
        ),
      ),
    );
  }
}
