import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/predict_delay_cubit.dart';
import '../models/day_of_week.dart';
import '../widgets/circular_percent_indicator.dart';
import '../widgets/linear_percent_indicator.dart';

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
    // Trigger prediction when building the page
    context.read<PredictDelayCubit>().predictDelay(selectedDay, airportId);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Prediction Result'),
        actions: [
          IconButton(
            icon: const Icon(Icons.close),
            onPressed: () {
              Navigator.popUntil(context, (route) => route.isFirst);
            },
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFe0f7fa), Color(0xFF80deea)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        width: double.infinity,
        child: BlocBuilder<PredictDelayCubit, PredictDelayState>(
          builder: (context, state) {
            if (state is PredictDelayLoading) {
              return const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(),
                    SizedBox(height: 16),
                    Text(
                      "Analyzing flight data...",
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                  ],
                ),
              );
            } else if (state is PredictDelayError) {
              return Center(
                child: Card(
                  margin: EdgeInsets.all(24),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  elevation: 4,
                  child: Padding(
                    padding: EdgeInsets.all(24.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.error_outline, color: Colors.red, size: 64),
                        SizedBox(height: 16),
                        Text(
                          'Oops! Something went wrong.',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 8),
                        Text(
                          state.error,
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            } else if (state is PredictDelaySuccess) {
              return Center(
                child: Card(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                  elevation: 8,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 32),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                          "Your Flight Delay Prediction",
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 32),
                        const Text(
                          "Flight Delay Probability",
                          style: TextStyle(fontSize: 18, color: Colors.black87),
                        ),
                        const SizedBox(height: 8),
                        CircularPercentIndicator(
                          radius: 120,
                          lineWidth: 12,
                          percent: state.response.delayChance.clamp(0, 1),
                          center: Text(
                            "${(state.response.delayChance * 100).toStringAsFixed(1)}%",
                            style: const TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                          progressColor: Colors.redAccent,
                          backgroundColor: Colors.grey.shade300,
                          animate: true,
                        ),
                        const SizedBox(height: 32),
                        const Text(
                          "Prediction Confidence",
                          style: TextStyle(fontSize: 18, color: Colors.black87),
                        ),
                        const SizedBox(height: 8),
                        LinearPercentIndicator(
                          percent:
                              (state.response.confidence / 100).clamp(0, 1),
                          lineHeight: 16,
                          progressColor: Colors.green,
                          backgroundColor: Colors.grey.shade300,
                          barRadius: const Radius.circular(8),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          "${state.response.confidence.toStringAsFixed(1)}%",
                          style: const TextStyle(fontSize: 18),
                        ),
                        const SizedBox(height: 32),
                        const Text(
                          "Plan your trip with confidence!",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 16, color: Colors.black87),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
