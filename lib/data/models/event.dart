import 'package:reunionou_mobileapp/data/models/user.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class Event {
  final int id;
  final String title;
  final String description;
  final String place;
  final String date;
  final String? status;
  final User creator;

  const Event({
    required this.id,
    required this.title,
    required this.description,
    required this.place,
    required this.date,
    this.status,
    required this.creator,
  });


  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'lieu': place,
      'date': date,
      'creator': creator.toJson(),
    };
  }

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      id: json['id'],
      title: json['event_title'],
      description: json['event_description'],
      place: json['event_place'],
      date: json['event_date'],
      status: json['event_status'],
      creator: User.fromJson(json['user']),
    );
  }

  Future<void> create() async {
    final response = await http.post(
      Uri.parse('http://docketu.iutnc.univ-lorraine.fr:54280/events/'),
      body: jsonEncode(toJson()), 
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to create event: ${response.body}');
    }

    // Update the event ID from the server response
    final data = jsonDecode(response.body);
    setId(data['id']);
  }

  void setId(int id){
    id = id;
  }
  
}