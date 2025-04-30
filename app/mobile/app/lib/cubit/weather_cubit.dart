import 'package:flutter_bloc/flutter_bloc.dart';

import '../repository/weather_repository.dart';

class WeatherCubit extends Cubit<WeatherState> {
  final WeatherRepository _repository;

  WeatherCubit(this._repository) : super(const WeatherInitial());

  Future<void> fetchWeather(String state) async {
    emit(const WeatherLoading());

    final result = await _repository.getWeather(state);

    result.fold(
      (failure) =>
          emit(WeatherError(error: failure.message ?? 'An error occurred')),
      (weatherData) => emit(WeatherSuccess(weatherData: weatherData)),
    );
  }
}

sealed class WeatherState {
  const WeatherState();
}

class WeatherInitial extends WeatherState {
  const WeatherInitial();
}

class WeatherLoading extends WeatherState {
  const WeatherLoading();
}

class WeatherSuccess extends WeatherState {
  final Map<String, dynamic> weatherData;

  const WeatherSuccess({required this.weatherData});
}

class WeatherError extends WeatherState {
  final String error;

  const WeatherError({required this.error});
}
