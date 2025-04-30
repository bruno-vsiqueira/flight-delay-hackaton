class PredictDelayResponseModel {
  final double delayChance;
  final double confidence;

  PredictDelayResponseModel(
      {required this.delayChance, required this.confidence});

  factory PredictDelayResponseModel.fromJson(Map<String, dynamic> json) {
    return PredictDelayResponseModel(
      delayChance: json['delay_chance'],
      confidence: json['confidence'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'delay_chance': delayChance,
      'confidence': confidence,
    };
  }
}
