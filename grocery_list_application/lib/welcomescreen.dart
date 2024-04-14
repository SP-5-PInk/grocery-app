import 'package:flutter/material.dart';
import 'package:grocery_list_application/login.dart';
import 'package:grocery_list_application/wrapper.dart';


class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFB6C7AC),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 40),
          Image.asset(
            'assets/clipart/homepagelogo.png',
            height: 150,
          ),
          SizedBox(height: 20),
          Text(
            'Welcome to Grocery App!',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              fontFamily: 'Roboto', 
              color: Color.fromARGB(232, 2, 22, 10),
            ),
          ),
          SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '"Shopping is a team effort"',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    color: Colors.grey[800], // Dark grey color
                  ),
                ),
              ],
            ),

          SizedBox(height: 30),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Login()),
              );
            },         
            child: Text('Start'),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
