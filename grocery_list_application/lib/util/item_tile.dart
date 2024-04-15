//import 'dart:js_util';

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:grocery_list_application/pages/list_page.dart';

class GroceryItemTile extends StatelessWidget {
  final String itemName; 
  final int? itemQuantity;
  final String? itemBrand;
  final String? itemCategory;
  final String? itemNotes;
  bool? itemChecked;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteFunction;
  Function(BuildContext)? editFunction;
  
  
  GroceryItemTile({super.key, 
    required this.itemName, 
    this.itemQuantity,
    this.itemBrand,
    this.itemCategory,
    this.itemNotes,
    this.itemChecked, 
    required this.onChanged,
    required this.deleteFunction,
    required this.editFunction
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25),
      
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(), 
          children: [
            SlidableAction(
              onPressed: editFunction,
              icon: Icons.more_horiz_rounded,
              backgroundColor: Color.fromRGBO(138, 133, 133, 1.0),
              label: 'Edit',
            ),
            SlidableAction(
              onPressed: deleteFunction,
              icon: Icons.delete_rounded,
              backgroundColor: Color.fromRGBO(172, 45, 45, 1.0),
              label: 'Delete',
            )

          ]
        ),
        child: GestureDetector(
          onTap: () {
            //Navigator.push(context, MaterialPageRoute(builder: (context) => ListPage(itemName: itemName,)));
          },
          child: Container(
            padding: EdgeInsets.only(left: 10, right: 24, top: 5, bottom: 5),
            decoration: BoxDecoration(
              color: Color.fromRGBO(217, 217, 217, 1.0),
              border: Border(bottom: BorderSide(width: 3, color: Color.fromRGBO(138, 133, 133, 1.0)),)
            ),
            child: Row(
              children: [
                Checkbox(
                  shape: CircleBorder(),
                  value: itemChecked, 
                  onChanged: onChanged,
                  activeColor: Color.fromRGBO(18, 18, 18, 1),
                ),
                
                Text(
                  itemName,
                  style: TextStyle(
                    decoration: itemChecked!
                    ? TextDecoration.lineThrough 
                    : TextDecoration.none,
                    fontSize: 30,
                  ),
                    
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}