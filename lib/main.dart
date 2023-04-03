import 'package:flutter/material.dart';
import './data/screens/user_screen.dart';
import './data/screens/home.dart';

void main() => runApp(const Reunionou());

class Reunionou extends StatelessWidget {
  const Reunionou({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Reunionou Mobile App',
      theme: ThemeData(fontFamily: 'Oswald'),
      initialRoute: Home.route, // Setting the initial route to the home page
      routes: {
        Home.route: (context) => const Home(),
        // Other routes here
      },
      onUnknownRoute: (settings) {
        // Handle unknown routes
        return MaterialPageRoute(
          builder: (context) => const Scaffold(
            body: Center(
              child: Text('Page not found'),
            ),
          ),
        );
      },
    );
  }
}
