import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/predict_delay_response_model.dart';
import '../repository/flights_repository.dart';

class PredictDelayError extends PredictDelayState {
  final String error;

  const PredictDelayError({required this.error});
}

/// Cubit for predicting flight delays
class PredictDelayCubit extends Cubit<PredictDelayState> {
  final FlightsRepository _repository;

  PredictDelayCubit(this._repository) : super(const PredictDelayInitial());

  Future<void> predictDelay(String dayOfWeek, String airportId) async {
    emit(const PredictDelayLoading());

    final result = await _repository.predictDelay(dayOfWeek, airportId);

    result.fold(
      (failure) => emit(
          PredictDelayError(error: failure.message ?? 'An error occurred')),
      (response) => emit(PredictDelaySuccess(response: response)),
    );
  }
}

/// States for PredictDelayCubit
sealed class PredictDelayState {
  const PredictDelayState();
}

class PredictDelayInitial extends PredictDelayState {
  const PredictDelayInitial();
}

class PredictDelayLoading extends PredictDelayState {
  const PredictDelayLoading();
}

class PredictDelaySuccess extends PredictDelayState {
  final PredictDelayResponseModel response;

  const PredictDelaySuccess({required this.response});
}
