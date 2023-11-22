// ignore_for_file: prefer_const_constructors

import 'package:suggesta/homePage/home_page.dart';
import 'package:suggesta/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:suggesta/data/NavigationProvider.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(suggesta());
}

class suggesta extends StatefulWidget {
  @override
  _suggestaState createState() => _suggestaState();
}

FirebaseAuth auth = FirebaseAuth.instance;

class _suggestaState extends State<suggesta> {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (context) => NavigationProvider(),
        child: FutureBuilder(
          future: _initialization,
          builder: (context, snapshot) {
            // Check for errors
            if (snapshot.hasError) {
              //return SomethingWentWrong();
            }
            if (snapshot.connectionState == ConnectionState.done) {
              return MaterialApp(
                  debugShowCheckedModeBanner: false, home: Wrapper());
            }
            return Text("");
          },
        ),
      );
}

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null && user.emailVerified) {
      return MaterialApp(debugShowCheckedModeBanner: false, home: login_page());
    } else {
      return login_page();
    }
  }
}
