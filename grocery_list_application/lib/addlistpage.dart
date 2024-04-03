import 'package:flutter/material.dart';

class AddListPage extends StatelessWidget {
  const AddListPage({super.key});

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
          title: const Padding(padding: EdgeInsets.only(top: 30), child: Text("A D D   L I S T", style: TextStyle(fontSize: 30, color: Color.fromRGBO(42, 64, 53, 1.0), fontWeight: FontWeight.bold,),)),
          backgroundColor: const Color.fromRGBO(90, 150, 121, 0),
          elevation: 0,
          
        ),

        body: ListView(
          padding: EdgeInsets.only(top: 40.0),
          scrollDirection: Axis.vertical,
          children: [
            Container(
              padding: EdgeInsets.only(top: 1, bottom: 1, left: 5),
              child: Text("LIST NAME", style: TextStyle(color: Color.fromRGBO(18, 18, 18, 1.0), fontSize: 20, fontWeight: FontWeight.bold)),
              decoration: BoxDecoration(color: Color.fromRGBO(138, 133, 133, 1.0), boxShadow: kElevationToShadow[4]),
              
            ),
            Padding(
              padding: EdgeInsets.only(top: 20, left: 15, right: 75),
              child: TextField(
                
                decoration: InputDecoration(
                  fillColor: Color.fromRGBO(250, 249, 246, .975),
                  filled: true,
                  border: OutlineInputBorder(),
                  hintText: "List Name"
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.only(top: 30, left: 10, right: 80),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context,'/homepage');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(18, 18, 18, 1.0),
                      
                    ),  
                    child: const Text('Create List', style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),  
                  ), 
                  SizedBox(width: 10),
                  
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context,'/homepage');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(172, 45, 45, 1.0),
                      
                    ),
                    child: const Text('Cancel', style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
                  ),  
                ],
              ),
            ),
          ],
        ),    
      ),
    );    
  }
}