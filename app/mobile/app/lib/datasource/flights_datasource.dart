import 'dart:convert';

import '../models/airport_model.dart';
import '../models/predict_delay_response_model.dart';

class FlightsDatasource {
  final String _airportsJson = '''
  [
     {
    "airportId": 14122,
    "airportName": "Pittsburgh International",
    "city": "Pittsburgh",
    "state": "PA"
  },
  {
    "airportId": 11066,
    "airportName": "Port Columbus International",
    "city": "Columbus",
    "state": "OH"
  },
  {
    "airportId": 14057,
    "airportName": "Portland International",
    "city": "Portland",
    "state": "OR"
  },
  {
    "airportId": 14492,
    "airportName": "Raleigh-Durham International",
    "city": "Raleigh/Durham",
    "state": "NC"
  },
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

  PredictDelayResponseModel predictDelay(String dayOfWeek, String airportId) {
    // Mocked response, ignoring input for now
    return PredictDelayResponseModel.fromJson(json.decode(_predictDelayJson));
  }
}
