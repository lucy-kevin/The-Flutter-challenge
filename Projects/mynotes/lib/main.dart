import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mynotes/constants/route.dart';
import 'package:mynotes/firebase_options.dart';
import 'package:mynotes/views/login_view.dart';
import 'package:mynotes/views/register_view.dart';
import 'dart:developer' as devtool show log;
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
      },
    ));
}
class HomePage extends StatelessWidget {
  const HomePage({super.key});

   @override
  Widget build(BuildContext context) {
    return  FutureBuilder(
          //initializing firebase
          future: Firebase.initializeApp(
                    options: DefaultFirebaseOptions.currentPlatform,
          
                  ),
          builder: (context, snapshot) {
            switch(snapshot.connectionState){ 
              case ConnectionState.done:
              final user = FirebaseAuth.instance.currentUser;
              if (user != null){
                if (user.emailVerified){
                  return const NotesView();
                  //print("Email is verified");
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

enum MenuAction{logout}
class NotesView extends StatefulWidget {
  const NotesView({super.key});

  @override
  State<NotesView> createState() => _NotesViewState();
}

class _NotesViewState extends State<NotesView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Main UI"),
        backgroundColor: Color.fromARGB(255, 102, 126, 45),
        actions: [
          PopupMenuButton<MenuAction>(
            onSelected: (value) async{
              switch(value){
                
                case MenuAction.logout:
                  final shouldLogout = await showLogOutDialog(context);
                  if(shouldLogout){
                    await FirebaseAuth.instance.signOut();
                    Navigator.of(context).pushNamedAndRemoveUntil(loginRoute,(_)=> false);
                  }
                  devtool.log(shouldLogout.toString());
             
              }

              devtool.log(value.toString());
            },
          itemBuilder: (context) {
            return const [
              PopupMenuItem(
                value: MenuAction.logout, 
                child:  Text("Log Out"),
                )
                ];
          }),
          
        ],
           ),
      body: const Text("Hello World"),

    );
  }
}
Future<bool> showLogOutDialog(BuildContext context){
  return showDialog<bool>(
    context: context, 
    builder: (context){
      return AlertDialog(
        title: const Text("Sign Out"),
        content: const Text("Are you sure you want to log out?"),
        actions: [
          TextButton(
            onPressed: (){
              Navigator.of(context).pop(false);
            }, 
            child: Text("Cancel"),),
          TextButton(
            onPressed: (){
              Navigator.of(context).pop(true);
            }, 
            child: Text("Log Out"),)
        ],
      );
    }
  ).then((value) => value ?? false);
}