import 'package:flutter/material.dart';

class User {
  final int id;
  final String name;
  final String? firstname;
  final String email;
  final String password;
  final String? status;
  

  const User({
    required this.id,
    required this.name,
    this.firstname,
    required this.email,
    required this.password,
    this.status,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'firstname': firstname,
      'email': email,
      'password': password,
      'status': status,
    };
  }

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
    id : json['id'],
    name :  json['name'],
    firstname :  json['firstname'],
    email :   json['email'],
    password:   json['password'],
    status :  json['status'],
    );
  }
}