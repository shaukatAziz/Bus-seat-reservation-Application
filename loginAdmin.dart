import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fyp_project/features/user_auth/firebase_auth_implementation/firebase_auth_services.dart';
import 'package:fyp_project/features/user_auth/presentation/pages/aapbar.dart';
import 'package:fyp_project/features/user_auth/presentation/pages/admin_panel.dart';
import 'package:fyp_project/features/user_auth/presentation/pages/applyOnline.dart';
import 'package:fyp_project/features/user_auth/presentation/pages/loginPage.dart';
import 'package:fyp_project/features/user_auth/presentation/pages/signupPage.dart';
import 'package:fyp_project/global/signupAdmin.dart';
import 'package:fyp_project/main.dart';

class AdminLogin extends StatefulWidget {
  const AdminLogin({super.key});
  @override
  State<AdminLogin> createState() => _AdminLoginState();
}

class _AdminLoginState extends State<AdminLogin> {
  @override
  bool _isSigning = false;
  final FirebaseAuthService _auth = FirebaseAuthService();

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    double W = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.0),


        child: AppBar(
          leading: PopupMenuButton<String>(
              icon:
              Icon(Icons.menu),
              onSelected: (String result){
                if(result=='Get Registered'){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>AdminSignUp()));
                }
                switch(result){
                  case 'Get Registered':

                    break;
                }
              },
              itemBuilder: (BuildContext context)=><PopupMenuEntry<String>>[
                const PopupMenuItem<String>(
                  value: 'Get Registered',

                  child: Text(
                    'Get Registered',
                    style: TextStyle(color: Colors.blue),
                  ),
                )]
          ),
          backgroundColor: Colors.brown,

          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(15),
                bottomLeft: Radius.circular(15),
              )
          ),
          title: Text('admin Login !',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),

        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: W,
              height: h * 0.3,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('data/assets/images/home.jpeg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              width: W,
              margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'sign into Your account',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.blue[500],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 10,
                          spreadRadius: 8,
                          offset: Offset(1, 1),
                          color: Colors.grey.withOpacity(0.2),
                        )
                      ],
                    ),
                    child: TextField(
                      controller: _emailController,
                      decoration: InputDecoration(
                          hintText: 'Enter your email',
                          prefixIcon: Icon(
                            Icons.email,
                            color: Colors.lightBlue,
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(color: Colors.white)),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(
                                color: Colors.white,
                              ))),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 10,
                          spreadRadius: 8,
                          offset: Offset(1, 1),
                          color: Colors.grey.withOpacity(0.2),
                        )
                      ],
                    ),
                    child: TextField(
                      controller: _passwordController,
                      decoration: InputDecoration(
                        hintText: 'Enter your password',
                        prefixIcon: Icon(
                          Icons.password,
                          color: Colors.cyanAccent,
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(color: Colors.white)),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: _signIn,
              child: Container(
                width: 100,
                height: 30,
                decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                    child: _isSigning
                        ? CircularProgressIndicator(
                      color: Colors.white,
                    )
                        : Text(
                      'Login',
                      style: TextStyle(
                          fontSize: 23, fontWeight: FontWeight.bold),
                    )),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Dont have an Account?'),
                SizedBox(
                  width: 5,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => AdminSignUp()),
                            (route) => false);
                  },
                  child: Text(
                    'Create',
                    style: TextStyle(color: Colors.blue),
                  ),
                )
              ],
            ),
            SizedBox(height: 20,),
            Column(children: [
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginnPage()));
                },
                  child: Text('Go back',style: TextStyle(color: Colors.green),))
            ],)
          ],
        ),
      ),
    );
  }

  void _signIn() async {
    setState(() {
      _isSigning = true;
    });
    String email = _emailController.text;
    String password = _passwordController.text;
    User? user = await _auth.signInWithEmailAndPassword(email, password);
    setState(() {});
    setState(() {
      _isSigning = false;
    });
    if (user != null) {
      print('user is successfully created');
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => AdminPanel()));
    } else {
      print('some error occured');
    }
  }
}
