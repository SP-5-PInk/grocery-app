import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Registration extends StatefulWidget {
  const Registration({super.key});

  @override
  _RegistrationState createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();

  signUp() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;
    // Check if passwords match
    if (password.text != confirmPassword.text) {
      // Show error message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Passwords do not match')),
      );
      return;
    }

    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: email.text,
        password: password.text,
      );
      user = userCredential.user;
      user = auth.currentUser;
    
      // Navigate back to login page after successful registration
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      // Show error message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: ${e.message}')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Registration")),
      backgroundColor: Color(0xFFB6C7AC), // Set background color
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Register',
              style: TextStyle(
                fontFamily: 'Roboto', // Use Roboto font
                fontSize: 24,
                color: Color.fromARGB(232, 2, 22, 10),
                fontWeight: FontWeight.bold,
              ),
            ),
            TextField(
              controller: email,
              decoration: InputDecoration(hintText: 'Enter email'),
            ),
            SizedBox(height: 10),
            TextField(
              controller: password,
              decoration: InputDecoration(hintText: 'Enter password'),
              obscureText: true,
            ),
            SizedBox(height: 10),
            TextField(
              controller: confirmPassword,
              decoration: InputDecoration(hintText: 'Confirm password'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: signUp,
              child: Text("Register"),
            ),
            SizedBox(height: 10),
            Image.asset(
              'assets/clipart/homepagelogo.png',
              height: 160,
            ),
            ElevatedButton(
              onPressed: () {
                // Navigate back to login page
                Navigator.pop(context);
              },
              child: Text(
                "Go Back",
                style: TextStyle(color: Colors.white), // Change text color to white
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black, // Change button color to black
              ),
            ),
          ],
        ),
      ),
    );
  }
}
