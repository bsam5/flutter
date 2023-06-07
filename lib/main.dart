import 'package:flutter/material.dart';
import 'package:quiz_app/core/cach_helper.dart';
import 'package:quiz_app/core/db/sqldb.dart';
import 'package:quiz_app/features/auth/views/splash.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'features/auth/views/login.dart';
import 'features/home/presentation/home.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SqlDb().intialDb();
  CacheHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quiz App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  SplashView(),
    );
  }
}

