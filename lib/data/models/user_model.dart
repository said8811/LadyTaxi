class LocationField {
  static String id = "id";
  static String locationName = "locationName";
  static String lattitude = "lattitude";
  static String longtitude = "longtitude";
  static String imgUrl = 'imgUrl';
}

class LocationModel {
  int? id;
  String locationName;
  double lattitude;
  double longtitude;

  LocationModel({
    this.id,
    required this.locationName,
    required this.lattitude,
    required this.longtitude,
  });

  factory LocationModel.fromJson(Map<String, dynamic> json) {
    return LocationModel(
      id: json['id'] ?? -1,
      locationName: json['locationName'] ?? "",
      lattitude: json['lattitude'] ?? 0.0,
      longtitude: json['longtitude'] ?? 0.0,
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'locationName': locationName,
      'lattitude': lattitude,
      'longtitude': longtitude,
    };
  }

  LocationModel copywith({
    int? id,
    String? locationName,
    double? lattitude,
    double? longtitude,
  }) =>
      LocationModel(
        id: id ?? this.id,
        locationName: locationName ?? this.locationName,
        lattitude: lattitude ?? this.lattitude,
        longtitude: longtitude ?? this.longtitude,
      );
}
