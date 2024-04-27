import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:grocery_list_application/pages/home_page.dart';

class ManageProfilePage extends StatefulWidget {
  const ManageProfilePage({super.key});

  @override
  State<ManageProfilePage> createState() => _ManageProfilePageState();
}

class _ManageProfilePageState extends State<ManageProfilePage> {

  TextEditingController currentPassword = TextEditingController();
  TextEditingController newPassword = TextEditingController();
  TextEditingController confirmNewPassword = TextEditingController();

  bool _isNewHidden = true;
  bool _isConfirmHidden = true;

changePassword() async {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  User? currentUser = firebaseAuth.currentUser;

  if (currentUser == null) {
    return;
  }

  try {
    AuthCredential credential = EmailAuthProvider.credential(email: currentUser.email!, password: currentPassword.text);
    await currentUser.reauthenticateWithCredential(credential);

    if (newPassword.text != confirmNewPassword.text) {
       ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Passwords do not match')),
      );
      return;
    }

    await currentUser.updatePassword(newPassword.text);
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Password Changed!')),
    );
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
    );

  } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error Changing password')),
      );
  }
}

  void _showNewPassword() {
      setState(() {
        _isNewHidden = !_isNewHidden;
      });
  }

  void _showConfirmPassword() {
      setState(() {
        _isConfirmHidden = !_isConfirmHidden;
      });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF5A9679),
      appBar: AppBar(
        backgroundColor: Color(0xFF5A9679),
        toolbarHeight: 100,
        leading: Builder(
          builder:(context) {
            return IconButton(
              icon: const Padding(padding: EdgeInsets.only(left: 15), child: Icon(Icons.arrow_back_rounded, color: Color.fromRGBO(42, 64, 53, 1.0), size: 40)),
              onPressed: () {
                Navigator.of(context).pop();
              },
            );
          },  
        ),
        centerTitle: true,
        title: const Text('MANAGE PROFILE', style: TextStyle(fontWeight: FontWeight.w900, fontSize: 30, color: Color.fromRGBO(42, 64, 53, 1.0)),),
        
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 40.0, left: 20, right: 60),
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Current Password",
                  style: TextStyle(fontSize: 15),
                ),
                const SizedBox(height: 5),
                TextField(
                  obscureText: _isNewHidden,
                  controller: currentPassword,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(borderSide: BorderSide(color: Color.fromRGBO(42, 64, 53, 1.0))),
                    focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide(color: Color.fromRGBO(42, 64, 53, 1.0), width: 2)),
                    suffix: InkWell(
                      onTap: _showNewPassword,
                      child: Icon(_isNewHidden ? Icons.visibility_rounded: Icons.visibility_off_rounded),
                      )
                  ),
                ),
              ],
            ),
            const SizedBox(height: 35),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "New Password",
                  style: TextStyle(fontSize: 15),
                ),
                const SizedBox(height: 5),
                TextField(
                  obscureText: _isNewHidden,
                  controller: newPassword,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(borderSide: BorderSide(color: Color.fromRGBO(42, 64, 53, 1.0))),
                    focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide(color: Color.fromRGBO(42, 64, 53, 1.0), width: 2)),
                    suffix: InkWell(
                      onTap: _showNewPassword,
                      child: Icon(_isNewHidden ? Icons.visibility_rounded: Icons.visibility_off_rounded),
                      )
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Confirm New Password",
                  style: TextStyle(fontSize: 15),
                ),
                const SizedBox(height: 5),
                TextField(
                  obscureText: _isConfirmHidden,
                  controller: confirmNewPassword,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(borderSide: BorderSide(color: Color.fromRGBO(42, 64, 53, 1.0))),
                    focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide(color: Color.fromRGBO(42, 64, 53, 1.0), width: 2)),
                    suffix: InkWell(
                      onTap: _showConfirmPassword,
                      child: Icon(_isConfirmHidden ? Icons.visibility_rounded: Icons.visibility_off_rounded),
                      )
                  ),
                ),
              ],
            ),
             Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: ElevatedButton(
                onPressed: () {
                    changePassword();
                },
                child: Text(
                  "Change password",
                  style: TextStyle(color: Colors.white), // Change text color to white
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black, // Change button color to black
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}