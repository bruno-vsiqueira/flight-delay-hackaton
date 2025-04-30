import 'package:dartz/dartz.dart';

import '../datasource/weather_datasource.dart';
import '../utils/base_failure.dart';

class WeatherRepository {
  final WeatherDatasource _datasource;

  WeatherRepository(this._datasource);

  Future<Either<BaseFailure, Map<String, dynamic>>> getWeather(
      String state) async {
    try {
      final weatherData = await _datasource.fetchWeather(state);
      return Right(weatherData);
    } catch (e, stackTrace) {
      final failure = BaseFailure(
        exception: e,
        stackTrace: stackTrace,
        message: 'Failed to fetch weather data',
      );
      return Left(failure);
    }
  }
}
