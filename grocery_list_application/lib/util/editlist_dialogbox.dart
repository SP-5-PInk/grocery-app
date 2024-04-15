import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:grocery_list_application/util/my_button.dart';

class EditListDialogBox extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;
  
  EditListDialogBox({
    super.key, 
    required this.controller,
    required this.onSave,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Center(child: Text("EDIT LIST", style: TextStyle(fontWeight: FontWeight.w900)),),
      content: Container(
        height: 150,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller: controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(borderSide: BorderSide(color: Color.fromRGBO(12, 12, 12, 1.0))),
                focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide(color: Color.fromRGBO(12, 12, 12, 1.0), width: 2)),
                hintText: "New List Name",
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MyButton(text: "Save", color: Color.fromRGBO(12, 12, 12, 1.0), onPressed: onSave),
                
                const SizedBox(width:10),
            
                MyButton(text: "Cancel", color: Color.fromRGBO(172, 45, 45, 1.0), onPressed: onCancel)
              ],
            )
          ],
        ),
      ),
    );
  }
}