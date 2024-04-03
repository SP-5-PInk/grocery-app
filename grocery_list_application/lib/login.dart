import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:grocery_list_application/registration.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  TextEditingController email=TextEditingController();
  TextEditingController password=TextEditingController();

  signIn()async{
    await FirebaseAuth.instance.signInWithEmailAndPassword(email: email.text, password: password.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            "Grocery App",
            style: TextStyle(
              fontFamily: 'Roboto', // Use Roboto font
              fontSize: 20,
            ),
          ),
        ),
        backgroundColor: Color(0xFFB6C7AC), // Set background color
        body:Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
            Text(
              'Grocery App Login',
              style: TextStyle(
                fontFamily: 'Roboto', // Use Roboto font
                fontSize: 24,
                color: Color.fromARGB(232, 2, 22, 10),
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
                        // Add Clipart Image
            Image.asset(
              'assets/clipart/homepagelogo.png',
              height: 180,
            ),

              TextField(
                controller: email,
                decoration: InputDecoration(hintText: 'Enter email'),
              ),
              TextField(
                controller: password,
                decoration: InputDecoration(hintText: 'Enter password'),
                obscureText: true,
              ),
  
              //SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: ElevatedButton(onPressed: (()=>signIn()), child: Text("Login")),
              ),
              SizedBox(height: 10),
              ElevatedButton(onPressed: () {
                // Navigate to the Registration page when the button is pressed
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Registration()),
                );
              },
              child: Text(
                "Register",
                style: TextStyle(color: Colors.white), // Change text color to white
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black, // Change button color to black
              ),
            )
            ],),
        )
    );
  }
}