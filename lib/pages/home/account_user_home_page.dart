import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class UserProfilePage extends StatefulWidget {
  @override
  _UserProfilePageState createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  File? _profilePicture;

  Future<void> _changeProfilePicture() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _profilePicture = File(pickedFile.path);
      });
    }
  }

  Future<void> _saveUserProfile() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user == null) return; // Ensure the user is signed in before saving

    String uid = user.uid;
    String username = _usernameController.text;
    String email = _emailController.text;

    if (_profilePicture != null) {
      // Upload the profile picture to Firebase Storage
      Reference storageReference = FirebaseStorage.instance
          .ref()
          .child('profilePictures')
          .child('$uid.jpg');

      UploadTask uploadTask = storageReference.putFile(_profilePicture!);
      TaskSnapshot snapshot = await uploadTask;
      String downloadUrl = await snapshot.ref.getDownloadURL();

      // Save the download URL of the profile picture in Firestore
      await FirebaseFirestore.instance
          .collection('users')
          .doc(uid)
          .update({'profilePicture': downloadUrl});
    }

    // Save the username and email in Firestore
    await FirebaseFirestore.instance.collection('users').doc(uid).update({
      'username': username,
      'email': email,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Profile Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage(
                  'images/slideimage4.png'), // Use a placeholder image here
            ),
            TextButton(
              onPressed: _changeProfilePicture,
              child: Text('Change Profile Picture'),
            ),
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(labelText: 'Username'),
            ),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            ElevatedButton(
              onPressed: _saveUserProfile,
              child: Text('Save Profile'),
            ),
          ],
        ),
      ),
    );
  }
}
