
import 'package:flutter/material.dart';

import 'package:grocery_list_application/main.dart';
import 'package:grocery_list_application/util/addlist_dialogbox.dart';
import 'package:grocery_list_application/util/editlist_dialogbox.dart';
import 'package:grocery_list_application/util/list_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = TextEditingController();
  
  List groceryList = [];

  /*void checkBoxChanged(bool? value, int index) {
    setState(() {
      groceryList[index][1] = !groceryList[index][1];
    });
  } */

  void saveNewList() {
    if(_controller.text.isEmpty) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Center(child: Text("ERROR")),
            content: Container(
              height: 100,
              child: const Center(
                child: Text("List Name field cannot be empty", style: TextStyle(color: Color.fromRGBO(172, 45, 45, 1.0), fontSize: 18), textAlign: TextAlign.center),
              ),
            ),
          );  
        },
      );
      return;
    }
    
    setState(() {
      groceryList.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
  }

  void createNewList() {
    showDialog(
      context: context, 
      builder: (context) {
        return DialogBox(
          controller: _controller,
          onAdd: saveNewList,
          onCancel: () => Navigator.of(context).pop(),
        );
      },
    );
  }

  void deleteList(int index) {
    setState(() {
      groceryList.removeAt(index);
    });
  }

  void editList(index) async {
    showDialog(
      context: context, 
      builder: (context) {
        return EditListDialogBox(
          controller: _controller,
          onSave: () {
            setState(() {
              groceryList[index][0] = _controller.text;
              _controller.clear();
            });
            Navigator.of(context).pop();
          },
          onCancel: () => Navigator.of(context).pop(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF5A9679),
      appBar: AppBar(
        backgroundColor: Color(0xFF5A9679),
        toolbarHeight: 100,
        leading: Builder(
            builder:(context) {
            return IconButton(
              icon: const Padding(padding: EdgeInsets.only(left: 15), child: Icon(Icons.menu_rounded, color: Color.fromRGBO(42, 64, 53, 1.0), size: 40)),
              onPressed: () => Scaffold.of(context).openDrawer(),);
            }  
          ),
        centerTitle: true,
        title: const Text('H O M E', style: TextStyle(fontWeight: FontWeight.w900, fontSize: 30, color: Color.fromRGBO(42, 64, 53, 1.0)),),
        actions: [
            IconButton(
              icon: const Padding(padding: EdgeInsets.only(right: 15), child: Icon(Icons.add_rounded, color: Color.fromRGBO(42, 64, 53, 1.0), size: 40)), // Add the icon here and set its color
              onPressed: createNewList,
            ),
          ],
      ),
      /*floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: Icon(Icons.add),
      ), */
      
      body: Column(
        children: [
          SizedBox(height: 40,),
          Container(
            width: 362,
            padding: EdgeInsets.only(top: 1, bottom: 1, left: 10),
            child: Text("LISTS", style: TextStyle(color: Color.fromRGBO(18, 18, 18, 1.0), fontSize: 20, fontWeight: FontWeight.w900)),
            decoration: BoxDecoration(color: Color.fromRGBO(138, 133, 133, 1.0), boxShadow: kElevationToShadow[4]),
            ),
          Expanded(
            child: ListView.builder(
              itemCount: groceryList.length,
              itemBuilder: (context, index) {
                return GroceryListTile(
                  listName: groceryList[index][0], 
                  taskCompleted: groceryList[index][1], 
                  //onChanged: (value) => checkBoxChanged(value, index),
                  deleteFunction: (context) => deleteList(index),
                  editFunction: (context) => editList(index),
                );
              },
            ),
          ),
        ],
      ),

      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      drawer: Drawer(
          backgroundColor: Color.fromRGBO(250, 249, 246, 1.0),
          child: GestureDetector(
            onTap: () {
              //Navigator.pushNamed(context,'/homepage');
            },
            child: const Column(
              children: [
                DrawerHeader(
                  child: Row(
                    children: [
                      Icon(Icons.menu, size: 40, color: Color.fromRGBO(192, 180, 180, 1.0)),
                      
                      Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Text("M E N U", style: TextStyle(color: Color.fromRGBO(192, 180, 180, 1.0), fontSize: 30, fontWeight: FontWeight.bold), ),
                      )
                    ],
                  ),
                ),  
                ListTile(
                  tileColor: Color.fromRGBO(192, 180, 180, 1.0),
                  leading: Icon(Icons.settings_rounded, color: Color.fromRGBO(18, 18, 18, 1.0), ),
                  title: Text("SETTINGS", style: TextStyle(color: Color.fromRGBO(18, 18, 18, 1.0), fontWeight: FontWeight.bold),),
                ),
                ListTile(
                  tileColor: Color.fromRGBO(192, 180, 180, 1.0),
                  leading: Icon(Icons.account_circle_rounded, color: Color.fromRGBO(18, 18, 18, 1.0)),
                  title: Text("MANAGE PROFILE", style: TextStyle(color: Color.fromRGBO(18, 18, 18, 1.0), fontWeight: FontWeight.bold),)
                ),      
              ],
            ),
          ),  
        ),
    );
  }
}