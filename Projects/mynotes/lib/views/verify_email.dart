

import 'package:flutter/material.dart';
import 'package:mynotes/constants/route.dart';
import 'package:mynotes/services/auth/auth_service.dart';

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
                await AuthService.firbase().sendEmailVerification();
                
              }
            , child: Text("Send email verification"),),
            TextButton(
            onPressed: ()async{
              await AuthService.firbase().logOut();
            
              Navigator.of(context).pushNamedAndRemoveUntil(registerRoute, (route)=>false);
            }, 
            child: const Text("Restart"))
          ],
      
        ),
    );
  }
}
