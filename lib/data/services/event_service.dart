import 'package:dio/dio.dart';
import 'package:reunionou_mobileapp/data/models/event.dart';

class EventService {
  late Event event ;
  final Dio _dio = Dio();

  Future<Event> getEvent() async {
    final response = await _dio.get('https://api.reunionou.local:19043/events/?embed=user');

    try{
      if (response.statusCode == 200 || response.statusCode == 304) {
        final dynamic eventData = response.data;

        return Event.fromJson(eventData);
      } else {
        throw Exception('Failed to load users');
      }
    }
    catch (e) {
      print(e);

    }
return event;
  }
}