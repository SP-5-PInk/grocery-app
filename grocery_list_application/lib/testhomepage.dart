import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

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
      appBar: AppBar(title: Text("Homepage"),),
      body: Center(
        child: Text('${user!.email}'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (()=> signout()),
        child: Icon(Icons.login_rounded),),
    );
  }
}