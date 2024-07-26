import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:prac/routes.dart';
import 'dart:developer' show log;

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
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
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          TextField(
            controller: _email,
            autocorrect: false,
            enableSuggestions: false,
            decoration: InputDecoration(
              hintText: "email")

          ),
          TextField(
            controller: _password,
            obscureText: true,
            autocorrect: false,
            enableSuggestions: false,
            decoration: InputDecoration(
              hintText: "password"
            ),

          ),
          TextButton(onPressed: () async{
            final email = _email.text;
            final password = _password.text;
            try{

            final userCredential =await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
            log("Loged in");
            } on FirebaseAuthException catch (e){
              if(e.code == "invalid-credential"){
                log("invalid Credentials");
              }else if(e.code == "invalid-email"){
                log("Invalid email address");
              }
              log(e.code);
              
            }


            
          }, child: const Text("Login")),
          TextButton(onPressed: (){
            Navigator.of(context).pushNamedAndRemoveUntil(Register_View, (route)=>false);
            
          }, child: const Text("Do not have an account? Register")),

        ],
      )
    );
  }
}