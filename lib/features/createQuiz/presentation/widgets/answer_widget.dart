import 'package:flutter/material.dart';

class AnswerWidget extends StatelessWidget {
  final String text;
  final double? textSize;
  final double? width;
  final GestureTapCallback? onTap;
  final double? borderRaduis;
  final int trueAnswer;
  final int answer;
  const AnswerWidget({Key? key, required this.text, this.textSize=20, this.width=180, this.onTap, this.borderRaduis=16, required this.trueAnswer, required this.answer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onTap,
      child: Container(
        margin: EdgeInsets.only(top: 10),
        height: 40,
        width: width,
        decoration: BoxDecoration(
            color:trueAnswer==answer?Colors.green: Colors.white,
            borderRadius: BorderRadius.circular(borderRaduis!)
        ),
        child: Center(
          child: Text(text,style:  TextStyle(
              fontSize:textSize,
              color:trueAnswer==answer?Colors.white: Colors.black,
              fontWeight: FontWeight.bold
          ),),
        ),
      ),
    );
  }
}
