import 'package:dio/dio.dart';

import '../models/airport_model.dart';
import '../models/day_of_week.dart';
import '../models/predict_delay_response_model.dart';

class FlightsDatasource {
  final Dio _dio = Dio(BaseOptions(baseUrl: 'http://localhost:8080'));

  final String _predictDelayJson = '''
  {
    "delayChance": 0.75,
    "confidence": 95.0
  }
  ''';

  Future<List<AirportModel>> fetchAirports() async {
    final response = await _dio.get('/airports');
    final List<dynamic> data = response.data;
    return data.map((json) => AirportModel.fromJson(json)).toList();
  }

  Future<PredictDelayResponseModel> predictDelay(
      DayOfWeek dayOfWeek, int airportId) async {
    // await Future.delayed(const Duration(seconds: 2));
    // return PredictDelayResponseModel.fromJson(json.decode(_predictDelayJson));
    final response = await _dio.post(
      '/predict-delay',
      data: {
        'dayOfWeek': dayOfWeek.toApiString(),
        'airportId': airportId,
      },
    );
    return PredictDelayResponseModel.fromJson(response.data);
  }
}
