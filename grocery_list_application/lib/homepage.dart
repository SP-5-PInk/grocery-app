import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:grocery_list_application/listpage.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color.fromRGBO(90, 150, 121, 1.0),
        appBar: AppBar(
          toolbarHeight: 100,
          leading: Builder(
            builder:(context) {
            return IconButton(
              icon: const Padding(padding: EdgeInsets.only(top: 30, left: 15), child: Icon(Icons.menu, color: Color.fromRGBO(42, 64, 53, 1.0), size: 40)),
              onPressed: () => Scaffold.of(context).openDrawer(),);
            }  
          ),
          centerTitle: true,
          title: const Padding(padding: EdgeInsets.only(top: 30), child: Text("H O M E", style: TextStyle(fontSize: 30, color: Color.fromRGBO(42, 64, 53, 1.0), fontWeight: FontWeight.bold,),)),
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

        drawer: const Drawer(
          backgroundColor: Color.fromRGBO(250, 249, 246, 1.0),
          child: Column(
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
                //shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
              ),
              
              ListTile(
                tileColor: Color.fromRGBO(192, 180, 180, 1.0),
                leading: Icon(Icons.account_circle_rounded, color: Color.fromRGBO(18, 18, 18, 1.0)),
                title: Text("MANAGE PROFILE", style: TextStyle(color: Color.fromRGBO(18, 18, 18, 1.0), fontWeight: FontWeight.bold),)
              )      
            ],
          ),
        ),
        
        body: ListView(
          padding: EdgeInsets.only(top: 80.0),
          scrollDirection: Axis.vertical,
          children: [
            Container(
              padding: EdgeInsets.only(top: 1, bottom: 1, left: 5),
              child: Text("RECENT LIST", style: TextStyle(color: Color.fromRGBO(18, 18, 18, 1.0), fontSize: 20, fontWeight: FontWeight.bold)),
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
                
                Text("COSTCO", style: TextStyle(color: Color.fromRGBO(18, 18, 18, 1.0), fontSize: 20, fontWeight: FontWeight.w900)),
                ],
              ),
              ),
            ),
            
            SizedBox(height: 50,),
            
            Container(
              padding: EdgeInsets.only(top: 1, bottom: 1, left: 5),
              child: Text("LISTS", style: TextStyle(color: Color.fromRGBO(18, 18, 18, 1.0), fontSize: 20, fontWeight: FontWeight.bold)),
              decoration: BoxDecoration(color: Color.fromRGBO(138, 133, 133, 1.0), boxShadow: kElevationToShadow[4]),
              
            ),

            Container(
              padding: EdgeInsets.only(top:2, bottom: 2, left: 20),
              decoration: BoxDecoration(color: Color.fromRGBO(217, 217, 217, 1.0)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                
                Text("PUBLIX", style: TextStyle(color: Color.fromRGBO(18, 18, 18, 1.0), fontSize: 20, fontWeight: FontWeight.w900)),
                Text("TARGET", style: TextStyle(color: Color.fromRGBO(18, 18, 18, 1.0), fontSize: 20, fontWeight: FontWeight.w900)),
                Text("FARMERS MARKET", style: TextStyle(color: Color.fromRGBO(18, 18, 18, 1.0), fontSize: 20, fontWeight: FontWeight.w900)),
                
              ],
              ),
            ),
          ],
        )
      ),
    );
  }
}