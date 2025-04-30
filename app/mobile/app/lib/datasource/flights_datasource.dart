import 'dart:convert';

import '../models/airport_model.dart';
import '../models/day_of_week.dart';
import '../models/predict_delay_response_model.dart';

class FlightsDatasource {
  final String _airportsJson = '''
  [
    {"airportId": "15304", "airportName": "Tampa International", "city": "Tampa", "state": "FL"},
    {"airportId": "12478", "airportName": "John F. Kennedy International", "city": "New York", "state": "NY"},
    {"airportId": "14122", "airportName": "Pittsburgh International", "city": "Pittsburgh", "state": "PA"},
    {"airportId": "14747", "airportName": "Seattle/Tacoma International", "city": "Seattle", "state": "WA"},
    {"airportId": "13930", "airportName": "Chicago O'Hare International", "city": "Chicago", "state": "IL"},
    {"airportId": "11292", "airportName": "Denver International", "city": "Denver", "state": "CO"},
    {"airportId": "12889", "airportName": "McCarran International", "city": "Las Vegas", "state": "NV"}
  ]
  ''';

  final String _predictDelayJson = '''
  {
    "delayChance": 0.75,
    "confidence": 95.0
  }
  ''';

  List<AirportModel> fetchAirports() {
    final List<dynamic> data = json.decode(_airportsJson);
    return data.map((json) => AirportModel.fromJson(json)).toList();
  }

  PredictDelayResponseModel predictDelay(
      DayOfWeek dayOfWeek, String airportId) {
    // In a real app, we would send the dayOfWeek and airportId to the API
    // For now, we're using the mock data
    return PredictDelayResponseModel.fromJson(json.decode(_predictDelayJson));
  }
}
