import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:prac/routes.dart';


class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  late final TextEditingController _email;
  late final TextEditingController _password;

  @override
  void initState() {
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
    return  Scaffold(
      appBar: AppBar(
        title: const Text("Register"),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      body: Column(

        children: [
          TextField(
            controller: _email,
            keyboardType: TextInputType.emailAddress,
            enableSuggestions: true,
            autocorrect: true,
            decoration: InputDecoration(
              hintText: "Enter email address here",
            ),
          ),
         TextField(
            controller: _password,
            obscureText: true,
            enableSuggestions: true,
            autocorrect: true,
            decoration: InputDecoration(
              hintText: "Enter password here"
            ),
          ),
          
          TextButton(
            onPressed: () async{
            final email = _email.text;
            final password = _password.text;

            try{
            final UserCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
            log(UserCredential.toString());
            } on FirebaseAuthException catch(e){
              if(e.code == "invalid-email"){
                log("Invalid Email Address");
              }else if(e.code =="weak-password"){
                log("Weak Password");
              
              }
              else if(e.code =="emil-already-in-use"){
                log("Email already in Use");
              
              }
              else{
                log(e.code);
              }
              log(e.code);
            } catch (e){
              log(e.toString());
              
              
            }

            },
            child: const Text("Register"),),
          TextButton(
            onPressed: (){
              Navigator.of(context).pushNamedAndRemoveUntil(Login_View, (route)=>false);
            },
            child: const Text("Already have an account, Login!"),),
        ],
      ),
    );
  }
}