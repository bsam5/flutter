import 'package:flutter/material.dart';

class CustomTextFormFiled extends StatelessWidget {
  final String? hint;
  final IconData ?suffix;
  final String? lable;
  final bool? obsecure;
  final TextEditingController controller;
  final String? Function(String?)?valid;
  final GestureTapCallback? tap;
  CustomTextFormFiled({Key? key,required this.lable,this.hint, this.suffix, required this.controller, this.obsecure, this.tap,  this.valid}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 23),
      child: TextFormField(
        validator: valid,
        obscureText: obsecure==true?true:false,
        controller: controller,
        decoration: InputDecoration(
          hintText: hint,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
          suffixIcon: InkWell(onTap:tap,child: Icon(suffix),),
          contentPadding: const EdgeInsets.symmetric(horizontal: 30,vertical: 20),
         // label: Container(margin: const EdgeInsets.symmetric(horizontal: 6),child: Text(lable!)),
        ),
      ),
    );
  }
}