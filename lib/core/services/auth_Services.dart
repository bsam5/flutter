import 'package:flutter/material.dart';
import 'package:quiz_app/core/db/sqldb.dart';
import 'package:quiz_app/features/home/presentation/home.dart';

import '../cach_helper.dart';

class AuthService{
  signInMethod(String email,String password,BuildContext context)async{
   SqlDb sqlDb=SqlDb();
   List<Map> user= await sqlDb.readData("SELECT * FROM 'user' WHERE email = '$email' AND password = '$password' ");
   if(user.isNotEmpty){

    await CacheHelper.saveData(key: "userId", value:user[0]['id']);
    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => const MyHomePage(),), (route) => false);
   }else{
     final SnackBar snackBar =SnackBar(content: Text("invalid email or password"),backgroundColor: Colors.red,);
     ScaffoldMessenger.of(context).showSnackBar(snackBar);
   }

  }
  signUpMethod(String email,String password,String name,BuildContext context)async {
    SqlDb sqlDb = SqlDb();

    List<Map> user = await sqlDb.readData(
        "SELECT * FROM 'user' WHERE email ='$email' ");
    print(user);
    if (user.isEmpty) {
      var response = await sqlDb.insertData(
          "INSERT INTO 'user' ('name','email','password') VALUES ('${name}','${email}','${password}')");
      List<Map> user= await sqlDb.readData("SELECT * FROM 'user' WHERE email = '$email' AND password = '$password' ");
      await CacheHelper.saveData(key: "userId", value:user[0]['id']);
      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => const MyHomePage(),), (route) => false);
    }else{
      final SnackBar snackBar = SnackBar(content: Text("This email is exist"),backgroundColor: Colors.red,);
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
}