import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:reunionou_mobileapp/main.dart';
import '../user.dart';

class UsersMaster extends StatefulWidget {
  @override
  _UsersMasterState createState() => _UsersMasterState();
}

class userProfile extends State<UserProfile>{
  List<User> _users = [];

  @override
  void initState() {
    super.initState();
    _fetchUsers();
  }

  final dio = Dio();
  Future<void> _fetchUsers() async {
    try {
      var response = await dio.get('https://api.reunionou.local:19043/users/');
      if (response.statusCode == 200 || response.statusCode == 304) {
        var getUsersData = response.data['data'];

        for (var element in getUsersData) {
          User user = User.fromJson(element);
          _users.add(user);
        }
      } else {
        throw Exception('Failed to load users');
      }
    } catch (e) {
      // Handle errors here
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
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: _users.length,
                itemBuilder: (context, index) {
                  return ListTile(

                    );
                },
              );
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }
            // Show loading indicator
            return CircularProgressIndicator();
          },
        )
    );
  }
}