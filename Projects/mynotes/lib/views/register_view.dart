
import 'dart:developer' as devtool show log;
import 'package:flutter/material.dart';
import 'package:mynotes/constants/route.dart';
import 'package:mynotes/services/auth/auth_exceptions.dart';
import 'package:mynotes/services/auth/auth_service.dart';

import 'package:mynotes/utilities/show_error_dialog.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  
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
      title: const Text("Register"),
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
                    AuthService.firbase().createUser(
                      email: email, 
                      password: password);
                     
                    
                    AuthService.firbase().sendEmailVerification();
                    Navigator.of(context).pushNamed(verifyEmailRoute);
                    
                  }on WeakPasswordAuthException{
                     await showErrorDialog(context, "Weak Password");
                      
                  }on EmailAlreadyInUseAuthException{
                    await showErrorDialog(context, "Email is already in use");
                  }on InvalidEmailAuthException{
                    await showErrorDialog(context, "Invalid Email Entered");
                  }on ChannelErrorAuthException{
                    await showErrorDialog(context, "Fill in both the Email and Password");
                    

                  }on GenericAuthException{
                    await showErrorDialog(context, "Authentication Error");
                    }
                  }, 
                  
                  child: const Text("Register"),          
                ),
                TextButton(
                  onPressed: (){
                    Navigator.of(context).pushNamedAndRemoveUntil( loginRoute , (route)=>false,);
                  }, 
                  child: const Text("Already registered? Login here")
                 )
              ],
            ),
   );




    
   
  }
}
