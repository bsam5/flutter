import 'package:flutter/material.dart';

import '../../home/presentation/home.dart';
import '../../home/widgets/default_button..dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding:const  EdgeInsets.only(top:200,left: 20,right: 20,bottom: 20),
        child: Column(
          children:  [
            const Text('Sorry!',style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.green
            ),),
            const SizedBox(height: 15,),
            const Text("you must add at least 5 questions to start"),
            const SizedBox(height: 15,),
            const Image(image: AssetImage("assets/images/faq.png"),width: 260,height: 260,),
            const SizedBox(height: 20,),
            DefaultButton(text: "Back To Home",onTap: () {
              Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => const MyHomePage(),), (route) => false);
            },),


          ],
        ),
      ),
    );
  }
}
