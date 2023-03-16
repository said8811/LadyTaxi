class SearchModel {
  List<Addresses>? addresses;

  SearchModel({this.addresses});

  SearchModel.fromJson(Map<String, dynamic> json) {
    if (json['addresses'] != null) {
      addresses = <Addresses>[];
      json['addresses'].forEach((v) {
        addresses!.add(new Addresses.fromJson(v));
      });
    }
  }
}

class Addresses {
  String addressFullText;
  String addressName;
  double boundedBottonLat;
  double boundedBottonLong;
  double boundedTopLat;
  double boundedTopLong;
  double coordinateLat;
  double coordinateLong;
  int id;

  Addresses({
    required this.addressFullText,
    required this.addressName,
    required this.boundedBottonLat,
    required this.boundedBottonLong,
    required this.boundedTopLat,
    required this.boundedTopLong,
    required this.coordinateLat,
    required this.coordinateLong,
    required this.id,
  });

  factory Addresses.fromJson(Map<String, dynamic> json) {
    return Addresses(
        addressFullText: json['address_text'] as String? ?? "",
        addressName: json['address_name'] as String? ?? "",
        boundedBottonLat: json['bounded_botton_lat'] as double? ?? 0.0,
        boundedBottonLong: json['bounded_botton_long'] as double? ?? 0.0,
        boundedTopLat: json['bounded_top_lat'] as double? ?? 0.0,
        boundedTopLong: json['bounded_top_long'] as double? ?? 0.0,
        coordinateLat: json['coordinate_lat'] as double? ?? 0.0,
        coordinateLong: json['coordinate_lon'] as double? ?? 0.0,
        id: json['id'] as int? ?? 0);
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = Map<String, dynamic>();
  //   data['address_full_text'] = this.addressFullText;
  //   data['address_name'] = this.addressName;
  //   data['bounded_botton_lat'] = this.boundedBottonLat;
  //   data['bounded_botton_long'] = this.boundedBottonLong;
  //   data['bounded_top_lat'] = this.boundedTopLat;
  //   data['bounded_top_long'] = this.boundedTopLong;
  //   data['coordinate_lat'] = this.coordinateLat;
  //   data['coordinate_long'] = this.coordinateLong;
  //   data['id'] = this.id;
  //   return data;
  // }
}
