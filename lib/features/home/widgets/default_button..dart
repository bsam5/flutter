import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  final String text;
  final double? textSize;
  final double? width;
  final GestureTapCallback? onTap;
  final double? borderRaduis;
  const DefaultButton({Key? key, required this.text, this.textSize=20, this.width=180, this.onTap, this.borderRaduis=16}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onTap,
      child: Container(
        height: 50,
        width: width,
        decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.circular(borderRaduis!)
        ),
        child: Center(
          child: Text(text,textAlign: TextAlign.center,style:  TextStyle(
            fontSize:textSize,
            color: Colors.white,
            fontWeight: FontWeight.bold
          ),),
        ),
      ),
    );
  }
}
