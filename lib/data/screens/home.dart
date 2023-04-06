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
            title: const Text(
              'Reunionou Mobile App',
              style: TextStyle(color: Colors.black),
            ),
            centerTitle: true,
            toolbarHeight: 40,
            backgroundColor: Colors.white,
          ),
          body: TabBarView(children: [
            EventScreen(title: 'Event details'),
            EventCreation(),
            UserProfile(id: '1')
          ]),
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, -3),
                ),
              ],
            ),
            child: TabBar(
              indicatorWeight: 5,
              labelColor: Colors.black,
              tabs: [
                Tab(
                  icon: Icon(Icons.event, color: Colors.black),
                  text: 'Mes évènements',
                ),
                Tab(
                  icon: Icon(Icons.add, color: Colors.black),
                  text: 'Créer un évènement',
                ),
                Tab(
                  icon: Icon(Icons.person, color: Colors.black),
                  text: 'Mon compte',
                ),
              ],
            ),
          ),
        )
    );
  }
}
