import 'package:dartz/dartz.dart';

import '../datasource/flights_datasource.dart';
import '../models/airport_model.dart';
import '../models/predict_delay_response_model.dart';
import '../utils/base_failure.dart';

class FlightsRepository {
  final FlightsDatasource _datasource;

  FlightsRepository(this._datasource);

  Future<Either<BaseFailure, List<AirportModel>>> getAirports() async {
    try {
      final airports = _datasource.fetchAirports();
      return Right(airports);
    } catch (e, stackTrace) {
      final failure = BaseFailure(
        exception: e,
        stackTrace: stackTrace,
        message: 'Failed to fetch airports',
      );
      return Left(failure);
    }
  }

  Future<Either<BaseFailure, PredictDelayResponseModel>> predictDelay(
      String dayOfWeek, String airportId) async {
    try {
      final response = _datasource.predictDelay(dayOfWeek, airportId);
      return Right(response);
    } catch (e, stackTrace) {
      final failure = BaseFailure(
        exception: e,
        stackTrace: stackTrace,
        message: 'Failed to predict delay',
      );
      return Left(failure);
    }
  }
}
