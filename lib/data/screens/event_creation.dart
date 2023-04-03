import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../models/event.dart';
import '../models/user.dart';
import 'dart:convert';

class EventCreation extends StatefulWidget {
  const EventCreation({Key? key}) : super(key: key);

  @override
  State<EventCreation> createState() => _EventCreationState();
}

class _EventCreationState extends State<EventCreation> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _creatorNameController = TextEditingController();
  final TextEditingController _creatorEmailController = TextEditingController();
  LatLng? _location;

  Future<void> _createEvent() async {
    final creator = User(
      id: 0, // L'ID sera généré automatiquement par le serveur
      name: _creatorNameController.text, 
      email: _creatorEmailController.text,
    );

    final newEvent = Event(
      id: 0, // L'ID sera généré automatiquement par le serveur
      title: _titleController.text,
      description: _descriptionController.text,
      lieu: _location?.toString() ?? '',
      date: _dateController.text,
      creator: creator,
    );

    // Envoi de la requête POST au serveur pour créer le nouvel événement
    // Code à ajouter ici

    Navigator.pop(context); // Retour à l'écran précédent après la création de l'événement
  }

  void _onMapCreated(GoogleMapController controller) {}

  void _onLocationSelected(LatLng location) {
    setState(() {
      _location = location;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Créer de nouveaux événements'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(
                labelText: 'Title',
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _descriptionController,
              decoration: InputDecoration(
                labelText: 'Description',
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _dateController,
              decoration: InputDecoration(
                labelText: 'Date',
              ),
            ),
            SizedBox(height: 32),
            Container(
              height: 200,
              child: GoogleMap(
                onMapCreated: _onMapCreated,
                onTap: _onLocationSelected,
                initialCameraPosition: CameraPosition(
                  target: LatLng(48.8566, 2.3522), // Paris, France
                  zoom: 11,
                ),
                markers: _location != null ? {
                  Marker(
                    markerId: MarkerId('location'),
                    position: _location!,
                  )
                } : {},
              ),
            ),
            SizedBox(height: 32),
            ElevatedButton(
              child: Text('Create Event'),
              onPressed: _createEvent,
            ),
          ],
        ),
      ),
    );
  }
}