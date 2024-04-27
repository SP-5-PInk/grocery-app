import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:grocery_list_application/auth/authenticationService.dart';
import 'package:grocery_list_application/pages/registration.dart';
import 'package:grocery_list_application/pages/home_page.dart';
import 'package:provider/provider.dart'; // Import HomePage class

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}



class _LoginState extends State<Login> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();


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
      body: Padding(
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
            Image.asset(
              'assets/clipart/homepagelogo.png',
              height: 160,
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
            Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: ElevatedButton(
                onPressed: () {
                  context.read<AuthenticationService>().signIn(email: email.text, password: password.text);
                },
              child: Text(
                  "Login",
                  style: TextStyle(color: Color.fromARGB(255, 21, 52, 21)),
                ),
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Registration()),
                );
              },
              child: Text(
                "Register",
                style: TextStyle(color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
              ),
            )
          ],
        ),
      ),
    );
  }
}
