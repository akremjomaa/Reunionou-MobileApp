import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../models/event.dart';
import 'home.dart';

class EventScreen extends StatefulWidget {
  const EventScreen({Key? key, required this.title}) : super(key: key);
  final String title;
  static String get route => '/EventScreen';

  @override
  State<EventScreen> createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen> {
  late Future<List<Event>> _events;

  @override
  void initState() {
    super.initState();
    _events = fetchEvents();
  }

  Future<List<Event>> fetchEvents() async {
    final dio = Dio();
    dio.options.headers['Access-Control-Allow-Credentials'] = true;
    dio.options.headers['Access-Control-Allow-Headers'] = "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token";
    dio.options.headers['Access-Control-Allow-Methods'] = "GET, POST, OPTIONS";
    final response = await dio.get('https://3270-77-132-56-139.eu.ngrok.io/events');
    return response.statusCode == 200
        ? response.data.map((eventJson) => Event.fromJson(eventJson)).toList()
        : throw Exception('Failed to fetch events');
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Event>>(
      future: _events,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final events = snapshot.data!;
          return ListView.builder(
            itemCount: events.length,
            itemBuilder: (context, index) {
              final event = events[index];
              return Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Text(
                          event.title,
                          style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Text(
                        'Date: ${event.date}',
                        style: TextStyle(fontSize: 17),
                      ),
                      Text(
                        'Lieu: ${event.lieu}',
                        style: TextStyle(fontSize: 17),
                      ),
                      SizedBox(height: 12),
                      ButtonBar(
                        alignment: MainAxisAlignment.start,
                        children: [
                          TextButton(
                            child: const Text('Event Details'),
                            onPressed: () {
                              Navigator.pushNamed(context, Home.route);
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              );
            },
          );
        } else {
          return snapshot.hasError
              ? Text('${snapshot.error}')
              : const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}