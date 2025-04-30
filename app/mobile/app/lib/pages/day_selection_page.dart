import 'package:flutter/material.dart';

import '../models/day_of_week.dart';
import 'airport_selection_page.dart';

class DaySelectionPage extends StatelessWidget {
  const DaySelectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select a Day'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: DayOfWeek.values.length,
        itemBuilder: (context, index) {
          final day = DayOfWeek.values[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8.0),
            child: ListTile(
              title: Text(day.displayName),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        AirportSelectionPage(selectedDay: day),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
