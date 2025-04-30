import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/airports_cubit.dart';
import '../models/day_of_week.dart';
import 'prediction_result_page.dart';

class AirportSelectionPage extends StatefulWidget {
  final DayOfWeek selectedDay;

  const AirportSelectionPage({super.key, required this.selectedDay});

  @override
  State<AirportSelectionPage> createState() => _AirportSelectionPageState();
}

class _AirportSelectionPageState extends State<AirportSelectionPage> {
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    context.read<AirportsCubit>().fetchAirports();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select an Airport'),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(56.0),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: const InputDecoration(
                hintText: 'Search by airport or city',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.search),
              ),
              onChanged: (value) {
                setState(() {
                  _searchQuery = value.toLowerCase();
                });
              },
            ),
          ),
        ),
      ),
      body: BlocBuilder<AirportsCubit, AirportsState>(
        builder: (context, state) {
          if (state is AirportsLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is AirportsError) {
            return Center(child: Text(state.error));
          } else if (state is AirportsSuccess) {
            final filteredAirports = state.airports.where((airport) {
              return airport.airportName.toLowerCase().contains(_searchQuery) ||
                  airport.city.toLowerCase().contains(_searchQuery);
            }).toList();

            return ListView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: filteredAirports.length,
              itemBuilder: (context, index) {
                final airport = filteredAirports[index];
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 8.0),
                  child: ListTile(
                    title: Text(airport.airportName),
                    subtitle: Text(airport.city),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PredictionResultPage(
                            selectedDay: widget.selectedDay,
                            airportId: airport.airportId,
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
