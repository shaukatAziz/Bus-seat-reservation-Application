import 'package:flutter/material.dart';
import 'package:fyp_project/features/user_auth/presentation/pages/loginPage.dart';
class splash_screen extends StatefulWidget {
  final Widget? child;
  const splash_screen({super.key, this.child});

  @override
  State<splash_screen> createState() => _splash_screenState();
}

class _splash_screenState extends State<splash_screen> {
  void initState(){
    Future.delayed(Duration(seconds: 5),(){
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) =>widget.child!), (route) => false);
      
    }
    );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:

              Container(

                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage('data/assets/images/home.jpeg'),
                  fit: BoxFit.cover,
                  )
                ),
                  child: Center(
                    child: Container(
                      width: double.infinity,
                      height: double.infinity,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [


                             Center

                              (child: Text('Hazara University Mansehra',style: TextStyle(fontSize: 20,color: Colors.blue,fontWeight: FontWeight.bold,),)),


                          Center(child: Text('Book Your seat Now!',style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold),)),
                              Image.asset('data/assets/images/bus.png',width: 100,height: 50,),

                          SizedBox(height: 350,),

                          Container(
                            height: 50,
                            width: 150,

                            decoration: BoxDecoration(

                                borderRadius: BorderRadius.circular(15),
                                boxShadow:[
                                  BoxShadow(color: Colors.red.withOpacity(0.8)),
                                ]

                            ),
                            child: Center(child: Text('Getting started...',style: TextStyle(fontSize: 15,backgroundColor: Colors.red,color: Colors.white,fontWeight: FontWeight.bold),)),
                          ),
                                ],
                              ),
                    ),

                        )

                    ),







              





    );
  }
}
