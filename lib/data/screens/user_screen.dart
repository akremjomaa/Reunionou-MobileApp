import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

import '../models/user.dart';

class UsersMaster extends StatefulWidget {
  const UsersMaster({super.key});

  @override
  State<UsersMaster> createState() => _UsersMasterState();
}

class _UsersMasterState extends State<UsersMaster>{
  final List<User> _users = [];
  Dio dio = new Dio();

  @override
  void initState() {
    super.initState();
    _fetchUsers();
  }

  Future<void> _fetchUsers() async {
    try {
      dio.options.headers['Access-Control-Allow-Credentials'] = true;
      dio.options.headers['Access-Control-Allow-Headers'] = "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token";
      dio.options.headers['Access-Control-Allow-Methods'] = "GET, POST, OPTIONS";
      var response = await dio.get('https://3270-77-132-56-139.eu.ngrok.io/users');
      if (response.statusCode == 200 || response.statusCode == 304) {
        var getUsersData = response.data['data'];
        print(getUsersData);

        // _users.addAll(getUsersData.map((element) => User.fromJson(element)));
        for(var element in getUsersData){
          User user = User.fromJson(element);
          _users.add(user);
        }
      } else {
        throw Exception('Failed to load users');
      }
    } catch (e) {
      print(e.toString());
      throw Exception('Failed to fetch users');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Users'),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: _fetchUsers(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            // Show the data in _fetchUsers
            return ListView.builder(
              itemCount: _users.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_users[index].name),
                  subtitle: Text(_users[index].email),
                );
              },
            );
          } else {
            // Show loading indicator
            return CircularProgressIndicator();
          }
        },
      )
    );
  }
}