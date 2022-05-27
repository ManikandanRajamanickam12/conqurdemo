class BodyMetricsRequest {
  BodyMetricsRequest({
    this.userId,
    this.height,
    this.heightUnit,
    this.weight,
    this.weightUnit,
  });

  BodyMetricsRequest.fromJson(dynamic json) {
    userId = json['user_id'];
    height = json['height_cm'];
    heightUnit = json['preferred_height_unit'];
    weight = json['weight_kg'];
    weightUnit = json['preferred_weight_unit'];
  }
  int? userId;
  double? height;
  String? heightUnit;
  double? weight;
  String? weightUnit;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['user_id'] = userId;
    map['height_cm'] = height;
    // map['preferred_height_unit'] = heightUnit;
    map['weight_kg'] = weight;
    // map['preferred_weight_unit'] = weightUnit;
    return map;
  }
}
