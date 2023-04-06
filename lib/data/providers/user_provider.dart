import '../models/user.dart';
import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  String _email = '';
  String _password = '';
  String _id = '';
  String _refreshToken = '';
  bool _isConnected = false;

  String get id => _id;
  String get refreshToken => _refreshToken;
  String get password => _password;
  String get email => _email;
  bool get isConnected => _isConnected;

  void setUser(User user, String id, String refreshToken, bool isConnected) {
    _email = user.email;
    _password = user.password;
    _id = id;
    _refreshToken = refreshToken;
    _isConnected = isConnected;
    notifyListeners();
  }

  void toggleIsConnected() {
    _isConnected = !_isConnected;
    notifyListeners();
  }
}