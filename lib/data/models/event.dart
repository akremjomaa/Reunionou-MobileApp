import 'package:reunionou_mobileapp/data/models/user.dart';

class Event {
  final int id;
  final String title;
  final String description;
  final String lieu;
  final String date;
  final String status;
  final User creator;


  const Event({
    required this.id,
    required this.title,
    required this.description,
    required this.lieu,
    required this.date,
    required this.status,
    required this.creator
  });

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      id : json['id'],
      title :  json['event_title'],
      description :  json['event_description'],
      lieu :   json['event_place'],
      date:   json['event_date'],
      status :  json['event_status'],
      creator: User.fromJson(json['user'])
    );
  }
}