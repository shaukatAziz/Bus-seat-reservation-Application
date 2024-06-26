import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fyp_project/features/user_auth/presentation/pages/home.dart';
import 'package:fyp_project/features/user_auth/presentation/pages/loginPage.dart';



import 'sinup.dart';

class AuthenticationWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text("Error");
        } else if (snapshot.hasData) {
          User? user = snapshot.data;
          if (user != null && user.emailVerified) {
            return HomePage();
          } else {
            return LoginnPage();
          }
        } else {
          return LoginnPage();
        }
      },
    );
  }
}
