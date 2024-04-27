import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:grocery_list_application/auth/authenticationService.dart';
import 'package:grocery_list_application/pages/home_page.dart';
import 'package:grocery_list_application/pages/login.dart';
import 'package:grocery_list_application/pages/welcomescreen.dart';
import 'package:grocery_list_application/wrapper.dart';
import 'package:provider/provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    home: MultiProvider(providers: [
      Provider<AuthenticationService>(
        create: (_)=>AuthenticationService(FirebaseAuth.instance),
        ),
      StreamProvider(create: (context) =>
        context.read<AuthenticationService>().authStateChanges, 
        initialData: null)
    ], child: AuthenticationWrapper(),
    ),
  ));
}

class AuthenticationWrapper extends StatelessWidget {
  const AuthenticationWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User?>();
    print(firebaseUser);
    if(firebaseUser != null){
      return HomePage();
    }else{
      return MyApp();
    }
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WelcomeScreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      //_counter++;
    });
  }



  @override
  Widget build(BuildContext context) {
    return Padding(
     padding: EdgeInsets.only(),
      /*child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion, 
          children: [
            SlidableAction(
              onPressed: deleteFunction,
              icon: Icons.delete,
              backgroundColor: Colors.red,
              borderRadius: BorderRadius.circular(0),
              )
          ]
          ),
        ), */
    );
  }
}