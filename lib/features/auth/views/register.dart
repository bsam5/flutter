import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/core/services/auth_Services.dart';
import 'package:quiz_app/features/auth/views/login.dart';
import 'package:quiz_app/features/createQuiz/presentation/widgets/default_form_field.dart';
import 'package:quiz_app/features/home/widgets/default_button..dart';





class SocialRegister extends StatelessWidget {
  var formKey=GlobalKey<FormState>();
  var emailControler=TextEditingController();
  var passwordControler=TextEditingController();
  var phoneControler=TextEditingController();
  var nameControler=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'REGISTER',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 38,
                  ),
                  CustomTextFormFiled(lable: "name", controller: nameControler,hint: "Name",valid: (value) {
                    if(value!.isEmpty){
                      return value;
                    }
                    return null;
                  },),
                  SizedBox(
                    height: 20,
                  ),
                  CustomTextFormFiled(lable: "email", controller: emailControler,hint: "Email",valid: (value) {
                    if(value!.isEmpty){
                      return value;
                    }
                    return null;
                  },),
                  SizedBox(
                    height: 20,
                  ),

                  CustomTextFormFiled(lable: "pass", controller: passwordControler,hint: "Password",valid: (value) {
                    if(value!.isEmpty){
                      return value;
                    }
                    return null;
                  },),
                  SizedBox(
                    height: 20,
                  ),

                  SizedBox(height: 25,),
                  DefaultButton(text: "Register",width: double.infinity,onTap: () {
                    if(formKey.currentState!.validate()){
                    AuthService().signUpMethod(emailControler.text, passwordControler.text, nameControler.text, context);
                    }
                  },),
                  SizedBox(
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
                          Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => Login_screen(),), (route) => false);

                        },
                        child: const Text(
                          'Login',
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