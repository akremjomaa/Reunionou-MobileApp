import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EventScreen extends StatefulWidget {
  const EventScreen({Key? key}) : super(key: key);

  @override
  State<EventScreen> createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('evennement'),
        centerTitle: true,

      ),
      body: Row(
        children: const[
           Text('maps here'),

        ],
      ),
    );
  }
}
