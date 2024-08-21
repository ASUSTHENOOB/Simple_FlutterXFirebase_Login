// ignore_for_file: camel_case_types

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebaseproject1/screens/home-page.dart';
import 'package:firebaseproject1/screens/login_page.dart';
import 'package:flutter/material.dart';

class authpage extends StatelessWidget {
  const authpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData)
          return HomeScreen();
        else
          return LoginScreen();
      },
    ));
  }
}
