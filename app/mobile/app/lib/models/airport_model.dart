class AirportModel {
  final String airportId;
  final String airportName;

  AirportModel({required this.airportId, required this.airportName});

  factory AirportModel.fromJson(Map<String, dynamic> json) {
    return AirportModel(
      airportId: json['airport_id'],
      airportName: json['airport_name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'airport_id': airportId,
      'airport_name': airportName,
    };
  }
}
