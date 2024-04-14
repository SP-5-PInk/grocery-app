import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:grocery_list_application/homepage.dart';
import 'package:grocery_list_application/login.dart';

class Testhomepage extends StatefulWidget {
  const Testhomepage({super.key});

  @override
  State<Testhomepage> createState() => _TesthomepageState();
}

class _TesthomepageState extends State<Testhomepage> {

  final user=FirebaseAuth.instance.currentUser;

  signout()async{
    await FirebaseAuth.instance.signOut();
  }
    
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context,snapshot){
          if (snapshot.hasData){
            return HomePage();
          }else{
            return Login();
          }
        }),
    );   
  }
}