


import 'package:flutter/material.dart';
import 'package:mynotes/constants/route.dart';
import 'package:mynotes/enums/menu_action.dart';
import 'package:mynotes/services/auth/auth_service.dart';
import 'package:mynotes/services/crud/notes_services.dart';

class NotesView extends StatefulWidget {
  const NotesView({super.key});

  @override
  State<NotesView> createState() => _NotesViewState();
}

class _NotesViewState extends State<NotesView> {
late final NotesService _notesService;
String get userEmail => AuthService.firbase().currentUser!.email!;

@override
  void initState() {
   _notesService =NotesService();
    
    super.initState();
  }
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Notes"),
        backgroundColor: Color.fromARGB(255, 102, 126, 45),
        foregroundColor: Colors.white,
        
        actions: [
          IconButton(
            onPressed: (){
              Navigator.of(context).pushNamed(newNoteRoute);
            }, 
            icon: const Icon(Icons.add)
            ),
          PopupMenuButton<MenuAction>(
            onSelected: (value) async{
              switch(value){
                
                case MenuAction.logout:
                  final shouldLogout = await showLogOutDialog(context);
                  if(shouldLogout){
                    await AuthService.firbase().logOut();
                   
                    Navigator.of(context).pushNamedAndRemoveUntil(
                      loginRoute,
                      (_)=> false
                      );
                  }

             
              }

             
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
      body: FutureBuilder(
        future: _notesService.getOrCreateUser(email: userEmail), 
        builder: (context, snapshot){
              switch(snapshot.connectionState){
              
              
              case ConnectionState.done:
                
                
                return StreamBuilder(
                  stream: _notesService.allNotes, 
                  builder: (context, snapshot){
                    switch(snapshot.connectionState){
                      
                      
                      case ConnectionState.waiting:  
                      case ConnectionState.active:
                       if(snapshot.hasData){
                        final allNotes = snapshot.data as List<DatabaseNote>;
                      

                       }else{
                        return const CircularProgressIndicator();
                       }
                      default:
                        return const CircularProgressIndicator();
                      
                    }
                  }
                  );
              default:
                return const CircularProgressIndicator();
            }
          }

      )

    );
  }
}
