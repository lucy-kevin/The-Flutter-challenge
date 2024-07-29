import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
