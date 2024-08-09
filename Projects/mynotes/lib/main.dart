import 'package:flutter/material.dart';
import 'package:mynotes/constants/route.dart';
import 'package:mynotes/services/auth/auth_service.dart';
import 'package:mynotes/views/login_view.dart';
import 'package:mynotes/views/notes/new_note_view.dart';
import 'package:mynotes/views/notes/notes_view.dart';
import 'package:mynotes/views/register_view.dart';
import 'package:mynotes/views/verify_email.dart';



void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(
    
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
      routes: {
        loginRoute :(context) => const LoginView(),
        registerRoute :(context) => const RegisterView(),
        notesRoute:(context) => const NotesView(),
        verifyEmailRoute :(context) => const VerifyEmailView(),
        newNoteRoute: (context) => const NewNoteView(),

      },
    ));
}
class HomePage extends StatelessWidget {
  const HomePage({super.key});

   @override
  Widget build(BuildContext context) {
    return  FutureBuilder(
          //initializing firebase
          future: AuthService.firbase().initialize(),
          builder: (context, snapshot) {
            switch(snapshot.connectionState){ 
              case ConnectionState.done:
              final user = AuthService.firbase().currentUser;
              if (user != null){
                if (user.isEmailVerified){
                  
                  return const NotesView();
                  
                }else{
                  return const VerifyEmailView();
                  
                }

              } else {
                return const LoginView();
                
              }
              // return const Text("Done");

          default:
            return const CircularProgressIndicator();    
            }
          }
        );
  }
}

