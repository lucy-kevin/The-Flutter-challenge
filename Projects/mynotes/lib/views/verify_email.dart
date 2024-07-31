
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mynotes/constants/route.dart';

class VerifyEmailView extends StatefulWidget {
  const VerifyEmailView({super.key});

  @override
  State<VerifyEmailView> createState() => _VerifyEmailViewState();
}

class _VerifyEmailViewState extends State<VerifyEmailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Verify Email"),
        backgroundColor: Color.fromARGB(255, 102, 126, 45),
      ),
      body: Column(
         
          children: [
            
            const Text("We've sent you an email verificatin, Please open it to verify your email"),
            const Text("If you haven't received the emai; yet, please press the button below"),
            TextButton(
              onPressed: ()async{
                final user = FirebaseAuth.instance.currentUser;
                await user?.sendEmailVerification();
              }
            , child: Text("Send email verification"),),
            TextButton(
            onPressed: ()async{
              await FirebaseAuth.instance.signOut();
              Navigator.of(context).pushNamedAndRemoveUntil(registerRoute, (route)=>false);
            }, 
            child: const Text("Restart"))
          ],
      
        ),
    );
  }
}
