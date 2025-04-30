import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/airport_model.dart';
import '../repository/flights_repository.dart';

class AirportsCubit extends Cubit<List<AirportModel>> {
  final FlightsRepository _repository;

  AirportsCubit(this._repository) : super([]);

  void fetchAirports() {
    final airports = _repository.getAirports();
    emit(airports);
  }
}
