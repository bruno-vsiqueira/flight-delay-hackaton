import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/predict_delay_response_model.dart';
import '../repository/flights_repository.dart';

class PredictDelayCubit extends Cubit<PredictDelayResponseModel?> {
  final FlightsRepository _repository;

  PredictDelayCubit(this._repository) : super(null);

  void predictDelay(String dayOfWeek, String airportId) {
    final response = _repository.predictDelay(dayOfWeek, airportId);
    emit(response);
  }
}
