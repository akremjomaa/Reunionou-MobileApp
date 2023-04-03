import 'package:flutter/material.dart';
import 'event_screen.dart';
import 'event_creation.dart';
import 'profile_screen.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);
  static String get route => '/Home';

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
            appBar: AppBar(
              leading: Container(),
              title: const Text(
                'Reunionou Mobile App',
                style: TextStyle(color: Colors.black),
              ),
              centerTitle: true,
              toolbarHeight: 60,
              backgroundColor: Colors.white,
              bottom: TabBar(
                indicatorWeight: 5,
                labelColor: Colors.black,
                tabs: [
                  Tab(
                    icon: Icon(Icons.event, color: Colors.black),
                    text: 'Events'
                  ),
                  Tab(
                    icon: Icon(Icons.add, color: Colors.black),
                    text: 'New event'
                  ),
                  Tab(
                    icon: Icon(Icons.person, color: Colors.black),
                    text: 'Profile'
                  ),
                ],
              ),
            ),
            body: TabBarView(children: [
              EventScreen(title: 'Event details'), 
              EventCreation(),
              ProfileScreen()
            ])
        )
    );
  }
}