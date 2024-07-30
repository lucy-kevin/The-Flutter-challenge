import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:prac/routes.dart';

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
      backgroundColor: Colors.black,
      foregroundColor: Colors.white,

    actions: [
      PopupMenuButton<MenuAction>(
        onSelected: (value) async{
          switch(value){
            case MenuAction.logout:
            final shouldLogOut = await ShowLogOutDialog(context);
            if(shouldLogOut){
              await FirebaseAuth.instance.signOut();
              Navigator.of(context).pushNamedAndRemoveUntil(Login_View, (_)=>false);

            }
          }

        },
        itemBuilder: (context){
          return const[
            PopupMenuItem(
              value: MenuAction.logout,
              child: Text("LogOut"))
          ];
        })
    ],

      
    ),
   );
  }
}
Future<bool> ShowLogOutDialog(BuildContext context){
  return showDialog<bool>(
    context: context, 
    builder: (context){
      return AlertDialog(
        title: const Text("Sign Out"),
        content: const Text("Are you sure you want to sign out?"),
        actions:[
          TextButton(
          onPressed:(){
            Navigator.of(context).pop(false);
          },
          child: const Text("Cancel"),
          ),
          TextButton(
            onPressed: (){
              Navigator.of(context).pop(true);

          }, 
          child: const Text("Log Out"),),
        ],

      );
    }
    ).then((value) => value??false);
}
