import 'package:flutter/material.dart';
import 'package:mynotes/utilities/dialog/generic_dialog.dart';

Future<bool> showDeleteDialog(BuildContext context){
  return showGenericDialog(
    context: context, 
    title: "Delet", 
    content: "Are you sure you want to delete this item", 
    optionsBuilder: ()=>{
      "Cancel": false,
      "Yes": true,
    },
    ).then(
      (value)=> value??false
      );
}