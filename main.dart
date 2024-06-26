import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fyp_project/features/aap/splashscreen/splashscreen.dart';
import 'package:fyp_project/features/user_auth/presentation/pages/loginPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {


  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  StripePayment.setOptions(
    StripeOptions(
      publishableKey: "your_publishable_key", // Replace with your actual publishable key
      merchantId: "Test", // Replace with your merchant ID
      androidPayMode: 'test', // Use 'production' for the production environment
    ),
  );
  runApp(const MyApp());
}
class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext Context){

    return MaterialApp(

      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        fontFamily: 'Futura',
        primarySwatch: Colors.teal,
      ),

      home: splash_screen(
        child: LoginnPage(),

      ),



    );
  }
}



