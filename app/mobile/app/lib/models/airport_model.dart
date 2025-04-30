class AirportModel {
  final int airportId;
  final String airportName;
  final String city;
  final String state;

  AirportModel({
    required this.airportId,
    required this.airportName,
    required this.city,
    required this.state,
  });

  factory AirportModel.fromJson(Map<String, dynamic> json) {
    return AirportModel(
      airportId: json['airportId'],
      airportName: json['airportName'],
      city: json['city'],
      state: json['state'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'airportId': airportId,
      'airportName': airportName,
      'city': city,
      'state': state,
    };
  }
}
