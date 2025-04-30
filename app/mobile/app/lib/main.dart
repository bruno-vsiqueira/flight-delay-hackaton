import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/airports_cubit.dart';
import 'cubit/predict_delay_cubit.dart';
import 'datasource/flights_datasource.dart';
import 'pages/home_page.dart';
import 'repository/flights_repository.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final datasource = FlightsDatasource();
    final repository = FlightsRepository(datasource);

    return MultiBlocProvider(
      providers: [
        BlocProvider<AirportsCubit>(
          create: (context) => AirportsCubit(repository),
        ),
        BlocProvider<PredictDelayCubit>(
          create: (context) => PredictDelayCubit(repository),
        ),
      ],
      child: MaterialApp(
        title: 'Flight Delay Predictor',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.blue,
            brightness: Brightness.light,
          ),
          useMaterial3: true,
          appBarTheme: const AppBarTheme(
            centerTitle: true,
            elevation: 0,
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          ),
          cardTheme: CardTheme(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            elevation: 4,
          ),
        ),
        home: const HomePage(),
      ),
    );
  }
}
