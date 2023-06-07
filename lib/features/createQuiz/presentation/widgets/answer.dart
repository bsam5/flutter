import 'package:flutter/material.dart';

class AnswerQuizButton extends StatelessWidget {
  final String text;
  final double? textSize;
  final double? width;
  final GestureTapCallback? onTap;
  final double? borderRaduis;
  const AnswerQuizButton({Key? key, required this.text, this.textSize=20, this.width=180, this.onTap, this.borderRaduis=16}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onTap,
      child: Container(
        height: 50,
        width: width,
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.green,width: 1),
            borderRadius: BorderRadius.circular(borderRaduis!)
        ),
        child: Container(
          padding: EdgeInsets.all(10),
          child: Text(text,style:  TextStyle(
              fontSize:textSize,
              fontWeight: FontWeight.bold
          ),),
        ),
      ),
    );
  }
}
