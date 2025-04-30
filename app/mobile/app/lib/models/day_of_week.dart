enum DayOfWeek {
  monday(displayName: 'Monday'),
  tuesday(displayName: 'Tuesday'),
  wednesday(displayName: 'Wednesday'),
  thursday(displayName: 'Thursday'),
  friday(displayName: 'Friday'),
  saturday(displayName: 'Saturday'),
  sunday(displayName: 'Sunday');

  final String displayName;
  const DayOfWeek({required this.displayName});

  // Helper method to convert enum to string for API
  String toApiString() {
    return displayName.toUpperCase();
  }

  // Helper method to get enum from string
  static DayOfWeek fromString(String value) {
    return DayOfWeek.values.firstWhere(
      (day) => day.displayName.toLowerCase() == value.toLowerCase(),
      orElse: () => DayOfWeek.monday,
    );
  }
}
