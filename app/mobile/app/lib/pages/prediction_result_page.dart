import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/predict_delay_cubit.dart';
import '../models/day_of_week.dart';

class PredictionResultPage extends StatelessWidget {
  final DayOfWeek selectedDay;
  final String airportId;

  const PredictionResultPage({
    super.key,
    required this.selectedDay,
    required this.airportId,
  });

  @override
  Widget build(BuildContext context) {
    context.read<PredictDelayCubit>().predictDelay(selectedDay, airportId);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Prediction Result'),
      ),
      body: BlocBuilder<PredictDelayCubit, PredictDelayState>(
        builder: (context, state) {
          if (state is PredictDelayLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is PredictDelayError) {
            return Center(child: Text(state.error));
          } else if (state is PredictDelaySuccess) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Delay Chance: ${(state.response.delayChance * 100).toStringAsFixed(2)}%',
                    style: const TextStyle(
                        fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Confidence: ${state.response.confidence.toStringAsFixed(2)}%',
                    style: const TextStyle(fontSize: 20),
                  ),
                ],
              ),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
