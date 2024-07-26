import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'dart:developer' as devtool show log ;

import 'package:mynotes/constants/route.dart';
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
                    
                  
                final userCredential = 
                  await FirebaseAuth.instance.signInWithEmailAndPassword(
                  email: email, 
                  password: password);

                devtool.log(userCredential.toString());
                   
                Navigator.of(context).
                   pushNamedAndRemoveUntil(
                   notesRoute ,
                   (route) => false,);
                    
                    
                    
                    } 
                    on FirebaseAuthException catch (e){
                      if (e.code == "invalid-credential"){
                         await showErrorDialog(context, "Invalid credentials");
                      }else if( e.code == "invalid-email"){
                       devtool.log("Invalid email Address");
                        await showErrorDialog(context, "Invalid email Address");
                        
      
                      }else{
                       //devtool.log("Something wrong has happened");

                       //devtool.log(e.code);
                       await showErrorDialog(context, "Something went wrong: \n${e.code}");
                      }
                      
      
                    } catch (e){
                      await showErrorDialog(context, e.toString());
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

Future<void> showErrorDialog(
  BuildContext context,
  String text,
){
  return showDialog(context: context, builder:(context ){
    return AlertDialog(
      title: const Text("An errors occurred"),
      content: Text(text),
      actions: [
        TextButton(
        onPressed: (){
          Navigator.of(context).pop();
        }, 
        child: const Text("Ok")
        )
      ],

    );
  });
}