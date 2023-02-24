class UserField {
  static String id = "id";
  static String fish = "fish";
  static String date = "date";
  static String number = "number";
  static String imgUrl = 'imgUrl';
}

class UserModel {
  int? id;
  String fish;
  String date;
  String number;
  String imgUrl;

  UserModel(
      {this.id,
      required this.fish,
      required this.date,
      required this.number,
      required this.imgUrl});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] ?? -1,
      fish: json['fish'] ?? "",
      date: json['date'] ?? "",
      number: json['number'] ?? "",
      imgUrl: json['imgUrl'] ?? "",
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'fish': fish,
      'date': date,
      'number': number,
      'imgUrl': imgUrl,
    };
  }

  UserModel copywith({
    int? id,
    String? fish,
    String? date,
    String? number,
    String? imgUrl,
  }) =>
      UserModel(
        id: id ?? this.id,
        fish: fish ?? this.fish,
        date: date ?? this.date,
        number: number ?? this.number,
        imgUrl: imgUrl ?? this.imgUrl,
      );
}
