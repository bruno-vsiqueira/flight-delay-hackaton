import 'dart:convert';

import '../models/airport_model.dart';
import '../models/predict_delay_response_model.dart';

class FlightsDatasource {
  final String _airportsJson = '''
  [
    {"airport_id": "15304", "airport_name": "Tampa International"},
    {"airport_id": "12478", "airport_name": "John F. Kennedy International"},
    {"airport_id": "14122", "airport_name": "Pittsburgh International"}
  ]
  ''';

  final String _predictDelayJson = '''
  {
    "delay_chance": 0.75,
    "confidence": 95.0
  }
  ''';

  List<AirportModel> fetchAirports() {
    final List<dynamic> data = json.decode(_airportsJson);
    return data.map((json) => AirportModel.fromJson(json)).toList();
  }

  PredictDelayResponseModel predictDelay(String dayOfWeek, String airportId) {
    // Mocked response, ignoring input for now
    return PredictDelayResponseModel.fromJson(json.decode(_predictDelayJson));
  }
}
