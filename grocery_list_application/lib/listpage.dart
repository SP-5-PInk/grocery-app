import 'package:flutter/material.dart';

class ListPage extends StatelessWidget {
  const ListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color.fromRGBO(90, 150, 121, 1.0),
        appBar: AppBar(
          toolbarHeight: 100,
          leading: IconButton(
            icon: const Padding(padding: EdgeInsets.only(top: 30, left: 15), child: Icon(Icons.arrow_back_rounded, color: Color.fromRGBO(42, 64, 53, 1.0), size: 40,)),
             onPressed: () {
              Navigator.of(context).pop();
            },),
          centerTitle: true,
          title: const Padding(padding: EdgeInsets.only(top: 30), child: Text("C O S T C O", style: TextStyle(fontSize: 30, color: Color.fromRGBO(42, 64, 53, 1.0), fontWeight: FontWeight.bold,),)),
          backgroundColor: const Color.fromRGBO(90, 150, 121, 0),
          elevation: 0,
          actions: [
            IconButton(
              icon: const Padding(padding: EdgeInsets.only(top: 30, right: 15), child: Icon(Icons.add, color: Color.fromRGBO(42, 64, 53, 1.0), size: 40)), // Add the icon here and set its color
              onPressed: () {
                // Implement the onPressed action here
              },
            ),
          ],
        ),
      ),
    );    
  }
}