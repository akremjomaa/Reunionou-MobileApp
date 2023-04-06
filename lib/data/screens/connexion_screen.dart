import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/user.dart';

class Connexion extends StatelessWidget {
  const Connexion({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var userProvider = context.watch<UserProvider>();
    var authUser = context.read<UserProvider>();
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.person),
            Text(userProvider.email),
          ],
        ),
        const SizedBox(height: 20),
        ElevatedButton(
            onPressed: () async {
              final user = User(
                email: userProvider.email,
                password: userProvider.password,
              );
              final dio = Dio();
              dio.options.headers['content-type'] = 'application/json';
              try {
                final response = await dio.post(
                  'https://fruits.shrp.dev/auth/logout',
                  data: jsonEncode(user.toJson()),
                );

                if (response.statusCode == 204) {
                  // Show success message
                  authUser.toggleIsConnected();
                } else {
                  // Show error message

                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Échec de déconnexion de l'utilisateur"),
                      backgroundColor: Colors.red,
                    ),
                  );
                }
              } catch (e) {
                // Show error message
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Erreur'),
                    backgroundColor: Colors.red,
                  ),
                );
              }
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            child: const Text('Se déconnecter'))
      ],
    );
  }
}
