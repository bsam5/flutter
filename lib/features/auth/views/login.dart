import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/core/cach_helper.dart';
import 'package:quiz_app/core/services/auth_Services.dart';
import 'package:quiz_app/features/auth/views/register.dart';
import 'package:quiz_app/features/createQuiz/presentation/widgets/default_form_field.dart';
import 'package:quiz_app/features/home/presentation/home.dart';
import 'package:quiz_app/features/home/widgets/default_button..dart';

class Login_screen extends   StatefulWidget {
  @override
  State<Login_screen> createState() => _Login_screenState();
}

class _Login_screenState extends State<Login_screen> {
  var emailControler =TextEditingController();

  var passwordControler =TextEditingController();

  var formKey=GlobalKey<FormState>();
  var isPassword=true;
  // void initState() {
  //   if(CacheHelper.getData(key: "userId")!=null){
  //     Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => MyHomePage(),), (route) => false);
  //   }
  //   // TODO: implement initState
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(23.0),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                 const  Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight:FontWeight.bold ,
                    ),
                  ),
                  const  SizedBox(
                    height: 38,
                  ),
                  CustomTextFormFiled(lable: "email", controller: emailControler,hint: "Email",valid: (value) {
                    if(value!.isEmpty){
                      return value;
                    }
                    return null;
                  },),
                  const SizedBox(
                    height: 20,
                  ),

                  CustomTextFormFiled(lable: "pass", controller: passwordControler,hint: "password",valid: (value) {
                    if(value!.isEmpty){
                      return value;
                    }
                    return null;
                  },),
                  const SizedBox(
                    height: 15,
                  ),
                  DefaultButton(text: "Login",width: double.infinity,onTap: () {
                    if(formKey.currentState!.validate()){
                      AuthService().signInMethod(emailControler.text, passwordControler.text,context);
                    }
                  },),
                  const SizedBox(
                    height: 3,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'dont have an account?',
                        style: TextStyle(
                          fontSize:16,
                        ),
                      ),
                      TextButton(
                        onPressed: (){
                           Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => SocialRegister(),), (route) => false);

                        },
                        child: const Text(
                          'Register',
                          style: TextStyle(fontSize: 16,color: Colors.green),
                        ),
                      ),
                    ],
                  ),


                ],
              ),
            ),
          ),
        ),
      ),

    );
  }
}