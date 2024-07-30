import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'dart:developer' as devtool show log;
import 'package:flutter/material.dart';
import 'package:mynotes/constants/route.dart';
import 'package:mynotes/firebase_options.dart';
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
                     
                    await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
                    
                    final user = FirebaseAuth.instance.currentUser;
                    await user?.sendEmailVerification();
                    Navigator.of(context).pushNamed(verifyEmailRoute);
                    
                  } on FirebaseAuthException catch (e){
                    if(e.code == "weak-password"){
                      await showErrorDialog(context, "Weak Password");
                      
                    }else if(e.code == "email-already-in-use"){
                      await showErrorDialog(context, "Email is already in use");
     
                    }else if(e.code == "invalid-email"){
                      devtool.log("Invalid Email Entered");
                      await showErrorDialog(context, "Invalid Email Entered");
                    }
                    else if(e.code == "channel-error"){
                      
                      await showErrorDialog(context, "Fill in both the Email and Password");
                    }
                    else{

                    showErrorDialog(context, "Error: ${e.code}");
                    devtool.log(e.code);
                    }
                  } catch (e){
                    devtool.log(e.toString());
                    await showErrorDialog(context, e.toString());
                  }
                  }
                  , 
                  
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
