import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:fyp_project/Student%20Registered.dart';
import 'package:fyp_project/features/user_auth/presentation/pages/applyOnline.dart';
import 'package:fyp_project/features/user_auth/presentation/pages/loginPage.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80.0),
        child: AppBar(
          title: Row(
            children: [
              Text('Home'),
              SizedBox(
                width: 100,
              ),
              GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => homePage()));
                  },
                  child: Text(
                    'Apply online',
                    style: TextStyle(color: Colors.lightBlueAccent),
                  )),
            ],
          ),
          leading: PopupMenuButton<String>(
              icon: Icon(Icons.menu),
              onSelected: (String result) {
                if (result == 'LogOut') {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginnPage()));
                }
                switch (result) {
                  case 'LogOut':
                    break;
                }
              },
              itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                    const PopupMenuItem<String>(
                      value: 'LogOut',
                      child: Text(
                        'LogOut',
                        style: TextStyle(color: Colors.blue),
                      ),
                    )
                  ]),
          centerTitle: true,
          elevation: 20,
          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
              colors: [
                Colors.purple,
                Colors.red,
              ],
              begin: Alignment.bottomRight,
              end: Alignment.topLeft,
            )),
          ),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(15),
            bottomLeft: Radius.circular(15),
          )),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                width: double.infinity,
                decoration: BoxDecoration(color: Colors.white),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Hazara University Mansehra',
                        style: TextStyle(color: Colors.black87, fontSize: 25),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 4,
              ),
              Text(
                'Welcome to Our Bus Booking App',
                style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.lightBlueAccent),
              ),
              SizedBox(height: 20.0),
              Text(
                'Book your bus tickets easily and quickly with our app. Enjoy your travel with the best services.',
                style: TextStyle(fontSize: 16.0),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Featured Routes',
                style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.lightBlueAccent),
              ),
              SizedBox(
                height: 40,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Column(
                      children: [
                        Container(
                          width: 200,
                          height: 200,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(21),
                              boxShadow: [
                                BoxShadow(blurRadius: 11),
                              ]),
                          child: Column(
                            children: [
                              Image.asset(
                                'data/assets/images/buspic.jpeg',
                                width: 100,
                                height: 100,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Center(child: Text('Hu to Mansehra')),
                              Center(
                                  child: Text(
                                      'Timing:Morning 8 am\n   AND Noon 5pm ')),
                              SizedBox(
                                height: 5,
                              ),
                              GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => homePage()));
                                  },
                                  child: Text(
                                    'See Details',
                                    style: TextStyle(
                                        decoration: TextDecoration.underline,
                                        color: Colors.blue),
                                  )),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 20,),
                    Column(
                      children: [
                        Container(
                          width: 200,
                          height: 200,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(21),
                              boxShadow: [
                                BoxShadow(blurRadius: 11),
                              ]),
                          child: Column(
                            children: [
                              Image.asset(
                                'data/assets/images/buspp.jpeg',
                                width: 100,
                                height: 100,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Center(child: Text('Hu to Abbotabad')),
                              Center(
                                  child: Text(
                                      'Timing:Morning 8 am\n   AND Noon 5pm ')),
                              SizedBox(
                                height: 5,
                              ),
                              GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => homePage()));
                                  },
                                  child: Text(
                                    'See Details',
                                    style: TextStyle(
                                        decoration: TextDecoration.underline,
                                        color: Colors.blue),
                                  )),
                            ],
                          ),
                        ),
                      ],
                    ),

                    SizedBox(
                      width: 20,
                    ),
                    Column(
                      children: [
                        Container(
                          width: 200,
                          height: 200,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(21),
                              boxShadow: [
                                BoxShadow(blurRadius: 11),
                              ]),
                          child: Column(
                            children: [
                              Image.asset(
                                'data/assets/images/busP.jpeg',
                                width: 100,
                                height: 100,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Center(child: Text('Hu to Balakot')),
                              Center(
                                  child: Text(
                                      'Timing:Morning 8 am\n   AND Noon 5pm ')),
                              SizedBox(
                                height: 5,
                              ),
                              GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => homePage()));
                                  },
                                  child: Text(
                                    'See Details',
                                    style: TextStyle(
                                        decoration: TextDecoration.underline,
                                        color: Colors.blue),
                                  )),
                            ],
                          ),
                        ),
                      ],
                    ),


                  ],
                ),

              ),
              SizedBox(height: 20,),
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>homePage()));
                },
                  child: Text('See All',style: TextStyle(fontSize: 20,color: Colors.blue,decoration: TextDecoration.underline),))
             , GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>StudentList()));
                },
                  child: Text('Student enrolled in bus',style: TextStyle(color: Colors.blue,fontSize: 20),))
            ],

        ),

      ),
    );
  }
}
