import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


class LongForm extends StatefulWidget {
  @override
  _LongFormState createState() => _LongFormState();
}

class _LongFormState extends State<LongForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _Father_NameController = TextEditingController();
  final TextEditingController _DepartmentController = TextEditingController();
  final TextEditingController _routesController = TextEditingController();

  final TextEditingController _rollNumberController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  // Add more controllers as needed

  final CollectionReference users = FirebaseFirestore.instance.collection('users');
  void _showAlertDialog(BuildContext context) {

    showDialog(

      context: context,
      builder: (BuildContext context) {
        return AlertDialog(

          backgroundColor: Colors.white, // Set custom background color
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0)), // Optional: Add rounded corners
          ),

          title: Text("Form Submitted"),
          content: Text("Your form has been submitted successfully!"),
          actions: [
            TextButton(
              child: Text("OK",),
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> submitForm() async {

    if (_formKey.currentState!.validate()?? false) {
      _formKey.currentState?.save();
      _showAlertDialog(context);
      await users
          .add({
        'name': _nameController.text,
        'Father_Name': _Father_NameController.text,
        'Department': _DepartmentController.text,
        'rollNumber': int.parse(_rollNumberController.text),
        'routes': _routesController.text,
        'email': _emailController.text,
        'address': _addressController.text,
        // Add more fields as needed
      })
          .then((value) => print("User Added"))
          .catchError((error) => print("Failed to add user: $error"));
    }

  }

  @override
  Widget build(BuildContext context) {
    double W = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text('Register Yourself',style: TextStyle(color: Colors.yellowAccent,fontWeight: FontWeight.bold),),
      ),
      body:

          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage('data/assets/images/home.jpeg'),
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Column(

                    children: [

                         TextFormField(
                         style: TextStyle(
                           color: Colors.white,
                           fontSize: 15,
                         ),
                          controller: _nameController,
                          decoration: InputDecoration(labelText: 'Name',
                            labelStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.blue)
                            ),
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                            contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your name';
                            }
                            return null;
                          },
                        ),
                       SizedBox(height: 10,),
                      TextFormField(
                        style: TextStyle(color: Colors.white),
                        controller: _Father_NameController,
                        decoration: InputDecoration(labelText: 'F.Name',
                          labelStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your name';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 15,),
                      TextFormField(
                        style: TextStyle(color: Colors.white),
                        controller: _DepartmentController,
                        decoration: InputDecoration(labelText: 'Dept',
                          labelStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),

                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your Deptt name';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 10,),
                      TextFormField(
                        style: TextStyle(color: Colors.white),
                        controller: _routesController,
                        decoration: InputDecoration(labelText: 'Route',
                          labelStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue)
                          ),
                          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please specify your route';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 10,),
                      TextFormField(
                        style: TextStyle(color: Colors.white),

                        controller: _rollNumberController,
                        decoration: InputDecoration(labelText: 'Rollnumber',
                          labelStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                        ),
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your rollnumber';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 10,),
                      TextFormField(
                        style: TextStyle(color: Colors.white),

                        controller: _emailController,
                        decoration: InputDecoration(labelText: 'Email',
                          labelStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),

                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 10,),
                      TextFormField(
                        style: TextStyle(color: Colors.white),

                        controller: _addressController,
                        decoration: InputDecoration(labelText: 'Address',
                          labelStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your address';
                          }
                          return null;
                        },
                      ),
                      // Add more fields as needed
                      SizedBox(height: 20),
                       ElevatedButton(
                          onPressed: submitForm,


                            child: Text('submit',),

                       ),




    ],

    ),
    ),
    ),
    ),
          ),
    );
  }
}

