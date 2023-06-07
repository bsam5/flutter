
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:quiz_app/features/auth/views/login.dart';

import '../../../core/cach_helper.dart';
import '../../home/presentation/home.dart';


class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  _SplashViewState createState() => _SplashViewState();
}
class _SplashViewState extends State<SplashView> {
  Timer? _timer;

  _startDelay() {
    _timer = Timer(const Duration(seconds: 2), _goNext);
  }

  _goNext() {
      if(CacheHelper.getData(key: "userId")!=null){
        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => MyHomePage(),), (route) => false);
      }else{
        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => Login_screen(),), (route) => false);
      }

  }

  @override
  void initState() {
    super.initState();
    _startDelay();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.green,
      body:
       Center(child:Text("QUIZLY",style: TextStyle(
        color: Colors.white,
        fontSize: 45,
        fontWeight: FontWeight.bold
      ),)),
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}