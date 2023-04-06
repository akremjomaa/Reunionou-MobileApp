import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import './data/screens/user_screen.dart';
import './data/screens/home.dart';
import './data/screens/connexion_screen.dart';

void main() => runApp(const Reunionou());

class Reunionou extends StatelessWidget {
  const Reunionou({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Reunionou Mobile App',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        primaryColor: Colors.deepOrange,
        textTheme: GoogleFonts.fredokaTextTheme(
          Theme.of(context).textTheme
        ),
      ),
      initialRoute: Home.route, // Setting the initial route to the home page
      debugShowCheckedModeBanner: false,
      routes: {
        Home.route: (context) => const Home(),
        // Other routes to be added later
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
