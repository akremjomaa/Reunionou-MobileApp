import 'package:flutter/material.dart';

class User {
  final int id;
  final String name;
  final String? firstname;
  final String email;
  final String? password;
  final String? status;
  final String? refresh_token;
  

  const User({
    required this.id,
    required this.name,
    this.firstname,
    required this.email,
    this.password,
    this.status,
    this.refresh_token,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'firstname': firstname,
      'email': email,
      'password': password,
      'status': status,
      'refresh_token': refresh_token,
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
    refresh_token :  json['refresh_token'],
    );
  }
}