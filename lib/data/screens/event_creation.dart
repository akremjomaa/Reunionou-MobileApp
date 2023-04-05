import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_map/flutter_map.dart';
import '../models/event.dart';
import '../models/user.dart';

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

  void _onLocationSelected(LatLng location) {
    setState(() {
      _location = location;
    });
  }

  Future<void> _createEvent() async {
    final creator = User(
      id: 0, // L'ID sera généré automatiquement par le serveur
      name: _creatorNameController.text, 
      email: _creatorEmailController.text,
    );

    final newEvent = Event(
      id: 0,
      title: _titleController.text,
      description: _descriptionController.text,
      place: _location?.toString() ?? '',
      date: _dateController.text,
      creator: creator,
    );

// Creating a new event by sending a POST request to the server
  try {
    await newEvent.create();
  } catch (e) {
    if (mounted) { // Vérifie si le widget est monté
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Error'),
          content: Text(e.toString()),
        ),
      );
    }
  }

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
              child: FlutterMap(
                options: MapOptions(
                  center: LatLng(48.8566, 2.3522), // Paris, France
                  zoom: 11,
                  onTap: (tapPosition, location) => _onLocationSelected(location),
                ),
                children: [
                  TileLayer(
                    urlTemplate:
                      "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png", 
                    subdomains: ['a', 'b', 'c'],
                  ),
                  MarkerLayer(
                    markers: _location != null ? [
                      Marker(
                        point: _location!,
                        builder: (ctx) => Icon(Icons.location_pin),
                        
                      )
                    ] : [],
                  ),
                ],
              ),
            ),
            SizedBox(height: 32),
            ElevatedButton(
              child: Text('Create Event'),
              onPressed: () {
                _createEvent();
                // Navigator.pop(context); // Retour à l'écran précédent après la création de l'événement
              }
            ),
          ],
        ),
      ),
    );
  }
}