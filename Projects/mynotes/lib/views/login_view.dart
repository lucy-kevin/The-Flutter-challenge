
import 'package:flutter/material.dart';
import 'dart:developer' as devtool show log ;

import 'package:mynotes/constants/route.dart';
import 'package:mynotes/services/auth/auth_exceptions.dart';
import 'package:mynotes/services/auth/auth_service.dart';
import 'package:mynotes/utilities/dialog/error_dialog.dart';

class LoginView extends StatefulWidget {
  const LoginView ({Key? key}): super(key:key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {

  late final TextEditingController _email;
  late final TextEditingController _password;

  void initState(){
    _email = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }
  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
        backgroundColor: Color.fromARGB(255, 102, 126, 45),
        ),
      body: Column(
                   children: [
                 TextField(
                  controller: _email,
                  enableSuggestions: false,
                  autocorrect: false,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    hintText: "Enter your Email",
                  ),
            
                ),
                TextField(
                  controller: _password,
                  obscureText: true,
                  enableSuggestions: false,
                  autocorrect: false,
                  decoration: const InputDecoration(
                    hintText: "Enter your Password",
                    
                  ),
                ),
                TextButton(
                  onPressed: () async{
                    
                    final email = _email.text;
                    final password = _password.text;
                  try{
                      await AuthService.firbase().logIn(
                        email: email, 
                        password: password);               
                      final user = AuthService.firbase().currentUser;

                      if(user?.isEmailVerified ?? false){
                         Navigator.of(context).
                         pushNamedAndRemoveUntil(
                         notesRoute ,
                        (route) => false,);
                     }else{
                         Navigator.of(context).pushNamed(verifyEmailRoute);} 
                  } on InvalidCredentialsAuthException {
                      await showErrorDialog(context, "Invalid credentials");
                   }on InvalidEmailAuthException{
                      await showErrorDialog(context, "Invalid Email Address");
                  }on GenericAuthException{
                      await showErrorDialog(context, "Authentication Error");
                  }                   
                  }, 
                  child: const Text("Login"),          
                ),
                TextButton(
                  onPressed: (){
                    Navigator.of(context).pushNamedAndRemoveUntil(
                      "/register/", 
                      (route) => false,
                      );
                  },
                  child: const Text("Not Registered yet? Register here"),)
              ],
            ),
    ); 

  }
}
