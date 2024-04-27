import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:grocery_list_application/pages/list_page.dart';

class GroceryListTile extends StatelessWidget {
  final String listName; 
  final bool taskCompleted;
  Function(BuildContext)? deleteFunction;
  Function(BuildContext)? editFunction;
  
  
  GroceryListTile({super.key, 
    required this.listName, 
    required this.taskCompleted, 
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
            Navigator.push(context, MaterialPageRoute(builder: (context) => ListPage(listName: listName,)));
          },
          child: Row(
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(left: 10, right: 24, top: 5, bottom: 5),
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(217, 217, 217, 1.0),
                    border: Border(bottom: BorderSide(width: 3, color: Color.fromRGBO(138, 133, 133, 1.0)),)
                  ),
                  child: Text(
                    listName,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      decoration: taskCompleted
                      ? TextDecoration.lineThrough 
                      : TextDecoration.none,
                      fontSize: 30,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}