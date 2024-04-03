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

        body: ListView(
          
          padding: EdgeInsets.only(top: 60.0),
          scrollDirection: Axis.vertical,
          children: [
            Container(
              padding: EdgeInsets.only(top: 1, bottom: 1, left: 5),
              child: Text("PRODUCE", style: TextStyle(color: Color.fromRGBO(18, 18, 18, 1.0), fontSize: 20, fontWeight: FontWeight.bold)),
              decoration: BoxDecoration(color: Color.fromRGBO(138, 133, 133, 1.0), boxShadow: kElevationToShadow[4]),
              
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => ListPage()));
              },
              child: Container(
              padding: EdgeInsets.only(top:2, bottom: 2, left: 20),
              decoration: BoxDecoration(color: Color.fromRGBO(217, 217, 217, 1.0)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                
                Row(
                  children: [
                    
                    Text("Carrots", style: TextStyle(color: Color.fromRGBO(18, 18, 18, 1.0), fontSize: 20, fontWeight: FontWeight.w900)),
                  ],
                ),
                Row(
                  children: [
                    
                    Text("Tomatoes", style: TextStyle(color: Color.fromRGBO(18, 18, 18, 1.0), fontSize: 20, fontWeight: FontWeight.w900)),
                  ],
                ),
                ],
              ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 1, bottom: 1, left: 5),
              child: Text("MEAT", style: TextStyle(color: Color.fromRGBO(18, 18, 18, 1.0), fontSize: 20, fontWeight: FontWeight.bold)),
              decoration: BoxDecoration(color: Color.fromRGBO(138, 133, 133, 1.0), boxShadow: kElevationToShadow[4]),
              
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => ListPage()));
              },
              child: Container(
              padding: EdgeInsets.only(top:2, bottom: 2, left: 20),
              decoration: BoxDecoration(color: Color.fromRGBO(217, 217, 217, 1.0)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                
                Row(
                  children: [
                    
                    Text("Chicken Breast", style: TextStyle(color: Color.fromRGBO(18, 18, 18, 1.0), fontSize: 20, fontWeight: FontWeight.w900)),
                  ],
                ),
                ],
              ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 1, bottom: 1, left: 5),
              child: Text("DAIRY", style: TextStyle(color: Color.fromRGBO(18, 18, 18, 1.0), fontSize: 20, fontWeight: FontWeight.bold)),
              decoration: BoxDecoration(color: Color.fromRGBO(138, 133, 133, 1.0), boxShadow: kElevationToShadow[4]),
              
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => ListPage()));
              },
              child: Container(
              padding: EdgeInsets.only(top:2, bottom: 2, left: 20),
              decoration: BoxDecoration(color: Color.fromRGBO(217, 217, 217, 1.0)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                
                Row(
                  children: [
                    
                    Text("Milk", style: TextStyle(color: Color.fromRGBO(18, 18, 18, 1.0), fontSize: 20, fontWeight: FontWeight.w900)),
                  ],
                ),
                ],
              ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 1, bottom: 1, left: 5),
              child: Text("OTHER", style: TextStyle(color: Color.fromRGBO(18, 18, 18, 1.0), fontSize: 20, fontWeight: FontWeight.bold)),
              decoration: BoxDecoration(color: Color.fromRGBO(138, 133, 133, 1.0), boxShadow: kElevationToShadow[4]),
              
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => ListPage()));
              },
              child: Container(
              padding: EdgeInsets.only(top:2, bottom: 2, left: 20),
              decoration: BoxDecoration(color: Color.fromRGBO(217, 217, 217, 1.0)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                
                Row(
                  children: [
                    
                    Text("Lucky Charms", style: TextStyle(color: Color.fromRGBO(18, 18, 18, 1.0), fontSize: 20, fontWeight: FontWeight.w900)),
                  ],
                ),
                ],
              ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 75, left: 30, right: 30),
              child: ElevatedButton(
                      onPressed: () {
                        //Navigator.pushNamed(context,'/homepage');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromRGBO(18, 18, 18, 1.0),
                        
                      ),
                      child: const Text('Add Item', style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
                    ),
            ),  
          ],  
        ),
      ),  
    );    
  }
}