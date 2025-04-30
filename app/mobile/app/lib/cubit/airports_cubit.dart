import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/airport_model.dart';
import '../repository/flights_repository.dart';

/// Cubit for fetching airports
class AirportsCubit extends Cubit<AirportsState> {
  final FlightsRepository _repository;

  AirportsCubit(this._repository) : super(const AirportsInitial());

  Future<void> fetchAirports() async {
    emit(const AirportsLoading());

    final result = await _repository.getAirports();

    result.fold(
      (failure) =>
          emit(AirportsError(error: failure.message ?? 'An error occurred')),
      (airports) => emit(AirportsSuccess(airports: airports)),
    );
  }
}

/// States for AirportsCubit
sealed class AirportsState {
  const AirportsState();
}

class AirportsInitial extends AirportsState {
  const AirportsInitial();
}

class AirportsLoading extends AirportsState {
  const AirportsLoading();
}

class AirportsSuccess extends AirportsState {
  final List<AirportModel> airports;

  const AirportsSuccess({required this.airports});
}

class AirportsError extends AirportsState {
  final String error;

  const AirportsError({required this.error});
}
