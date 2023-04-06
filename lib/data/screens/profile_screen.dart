import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class UserProfile extends StatefulWidget {
  final String id;
  UserProfile({required this.id});

  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  Map<String, dynamic> member = {};

  @override
  void initState() {
    super.initState();
    getUser();
  }

  Future<void> getUser() async {
    final response = await http.get(Uri.parse('https://api.reunionou.local:19043/users/4638/'));
    if (response.statusCode == 200) {
      setState(() {
        member = json.decode(response.body)['user'];
      });
    } else {
      throw Exception('Failed to load user');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mon compte'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Bonjour ${member['firstname']} ${member['lastname']}',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16.0),
            Text(
              'Votre Adresse mail : ${member['email']}',
              style: TextStyle(fontSize: 20.0),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {},
              child: Text('Modifier votre compte'),
            ),
          ],
        ),
      ),
    );
  }
}