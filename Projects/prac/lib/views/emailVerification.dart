import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:prac/routes.dart';
import 'package:prac/views/loginView.dart';

class EmailVerificationView extends StatefulWidget {
  const EmailVerificationView({super.key});

  @override
  State<EmailVerificationView> createState() => _EmailVerificationViewState();
}

class _EmailVerificationViewState extends State<EmailVerificationView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Verify"),
        foregroundColor: Colors.white,
        backgroundColor: Colors.black,
      ),
      body: TextButton(
        onPressed: ()async{
          final user = FirebaseAuth.instance.currentUser;
          user?.sendEmailVerification();
          Navigator.of(context).pushNamedAndRemoveUntil(Login_View, (route) => false);
        }
      , child: const Text("Send Email Verification"),
      )
    );
  }
}