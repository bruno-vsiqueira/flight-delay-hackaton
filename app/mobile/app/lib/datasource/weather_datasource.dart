import 'package:dio/dio.dart';

class WeatherDatasource {
  final String _apiKey = 'YOUR_OPENWEATHER_API_KEY';
  final String _baseUrl = 'https://api.openweathermap.org/data/2.5/weather';
  final Dio _dio;

  WeatherDatasource(this._dio);

  Future<Map<String, dynamic>> fetchWeather(String state) async {
    try {
      final response = await _dio.get(
        _baseUrl,
        queryParameters: {
          'q': '$state,US',
          'appid': _apiKey,
          'units': 'metric',
        },
      );
      return response.data;
    } catch (e) {
      throw Exception('Failed to fetch weather data: $e');
    }
  }
}
