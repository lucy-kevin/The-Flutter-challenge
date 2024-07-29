import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:prac/firebase_options.dart';
import 'package:prac/routes.dart';
import 'package:prac/views/emailVerification.dart';
import 'package:prac/views/loginView.dart';
import 'package:prac/views/notes_view.dart';
import 'package:prac/views/registerView.dart';
import "dart:developer" show log;

void main() {
  WidgetsFlutterBinding.ensureInitialized;
  runApp(MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
      routes : {
        Register_View: (context) => const RegisterView(),
        Login_View : (context) => const LoginView(),
        EmailVerification_View: (context) => const EmailVerificationView(),
        Notes_View: (context) => const NotesView(),

      },
       ));
}
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
   
      return FutureBuilder(
        future: Firebase.initializeApp(
          options: DefaultFirebaseOptions.currentPlatform,
        ),
        builder: (context, snapshot) {
          switch(snapshot.connectionState){
            
            case ConnectionState.done:
            final user = FirebaseAuth.instance.currentUser;
            if(user != null){
              if(user.emailVerified){
                log(user.toString());
                return const NotesView();
              }else{
                return const EmailVerificationView();
              }
            } else {
              return const RegisterView();
            }
            default:
              return const CircularProgressIndicator();
        }
        // Add a return statement at the end
        }
          
          
        );
      

    
  }
}


