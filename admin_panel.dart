import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:url_launcher/url_launcher.dart';

class AdminPanel extends StatefulWidget {
  @override
  _AdminPanelState createState() => _AdminPanelState();
}

class _AdminPanelState extends State<AdminPanel> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  TextEditingController nameController = TextEditingController();
  TextEditingController definitionController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  // Method to update a document
  Future<void> _updateDocument(String docId, String newName, String newDefinition) async {
    await _firestore.collection('Fetch Data').doc(docId).update({
      'name': newName,
      'definition': newDefinition,
    });
  }

  // Method to delete a document
  Future<void> _deleteDocument(String docId) async {
    await _firestore.collection('Fetch Data').doc(docId).delete();
  }

  // Method to add a new document
  Future<void> _addDocument(String name, String definition) async {
    await _firestore.collection('Fetch Data').add({
      'name': name,
      'definition': definition,
    });
  }

  // Method to show a dialog for updating the document
  void _showUpdateDialog(DocumentSnapshot doc) {
    nameController.text = doc['name'];
    definitionController.text = doc['definition'];

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Update Document'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: InputDecoration(labelText: 'Name'),
              ),
              TextField(
                controller: definitionController,
                decoration: InputDecoration(labelText: 'Definition'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                _updateDocument(doc.id, nameController.text, definitionController.text);
                Navigator.of(context).pop();
              },
              child: Text('Update'),
            ),
          ],
        );
      },
    );
  }

  // Method to show a dialog for adding a new document
  void _showAddDialog() {
    nameController.clear();
    definitionController.clear();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Add Document'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: InputDecoration(labelText: 'Name'),
              ),
              TextField(
                controller: definitionController,
                decoration: InputDecoration(labelText: 'Definition'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                _addDocument(nameController.text, definitionController.text);
                Navigator.of(context).pop();
              },
              child: Text('Add'),
            ),
          ],
        );
      },
    );
  }

  // Method to send an email
  void _sendEmail(String recipientEmail) async {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: recipientEmail,
      queryParameters: {
        'subject': 'Your Subject Here',
        'body': 'Your Email Body Here',
      },
    );
    if (await canLaunch(emailLaunchUri.toString())) {
      await launch(emailLaunchUri.toString());
    } else {
      throw 'Could not launch $emailLaunchUri';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Panel'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: emailController,
                    decoration: InputDecoration(labelText: 'Recipient Email'),
                  ),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    _sendEmail(emailController.text);
                  },
                  child: Text('Send Email'),
                ),
              ],
            ),
          ),
          SizedBox(height: 30), // Add space between email option and collection
          Expanded(
            child: StreamBuilder(
              stream: _firestore.collection('Fetch Data').snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(child: CircularProgressIndicator());
                }
                var documents = snapshot.data?.docs;
                return ListView.builder(
                  itemCount: documents?.length,
                  itemBuilder: (context, index) {
                    var doc = documents?[index];
                    var data = doc?.data();
                    return ListTile(
                      title: Text(data?['name']),
                      subtitle: Text(data?['definition']),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: Icon(Icons.edit),
                            onPressed: () {
                              _showUpdateDialog(doc!);
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () {
                              _deleteDocument(doc!.id);
                            },
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAddDialog();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
