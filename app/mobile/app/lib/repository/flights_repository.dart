import '../datasource/flights_datasource.dart';
import '../models/airport_model.dart';
import '../models/predict_delay_response_model.dart';

class FlightsRepository {
  final FlightsDatasource _datasource;

  FlightsRepository(this._datasource);

  List<AirportModel> getAirports() {
    return _datasource.fetchAirports();
  }

  PredictDelayResponseModel predictDelay(String dayOfWeek, String airportId) {
    return _datasource.predictDelay(dayOfWeek, airportId);
  }
}
