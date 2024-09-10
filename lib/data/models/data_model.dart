import 'dart:convert';

class Data {
  final int packagesReceived;
  final int packagesMissing;
  final int packagesReturned;
  final int packagesMissingReturn;
  final List<Package> packages;

  Data({
    required this.packagesReceived,
    required this.packagesMissing,
    required this.packagesReturned,
    required this.packagesMissingReturn,
    required this.packages,
  });

  factory Data.fromJson(String str) => Data.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Data.fromMap(Map<String, dynamic> json) => Data(
        packagesReceived: json["packages_received"],
        packagesMissing: json["packages_missing"],
        packagesReturned: json["packages_returned"],
        packagesMissingReturn: json["packages_missing_return"],
        packages:
            List<Package>.from(json["packages"].map((x) => Package.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "packages_received": packagesReceived,
        "packages_missing": packagesMissing,
        "packages_returned": packagesReturned,
        "packages_missing_return": packagesMissingReturn,
        "packages": List<dynamic>.from(packages.map((x) => x.toMap())),
      };
}

class Package {
  final String id;
  final String data;
  final List<Status> status;

  Package({
    required this.id,
    required this.data,
    required this.status,
  });

  factory Package.fromJson(String str) => Package.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Package.fromMap(Map<String, dynamic> json) => Package(
        id: json["id"],
        data: json["data"],
        status: List<Status>.from(json["status"].map((x) => Status.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "data": data,
        "status": List<dynamic>.from(status.map((x) => x.toMap())),
      };
}

class Status {
  final String hour;
  final String date;
  final Condition condition;
  final String message;

  Status({
    required this.hour,
    required this.date,
    required this.condition,
    required this.message,
  });

  factory Status.fromJson(String str) => Status.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Status.fromMap(Map<String, dynamic> json) => Status(
        hour: json["hour"],
        date: json["date"],
        condition: conditionValues.map[json["condition"]] ?? Condition.none,
        message: json["message"],
      );

  Map<String, dynamic> toMap() => {
        "hour": hour,
        "date": date,
        "condition": conditionValues.reverse[condition],
        "message": message,
      };
}

enum Condition { received, returned, delivered, misplaced, retained, none }

final conditionValues = EnumValues({
  "received": Condition.received,
  "returned": Condition.returned,
  "delivered": Condition.delivered,
  "misplaced": Condition.misplaced,
  "retained": Condition.retained,
  "none": Condition.none,
});

class EnumValues<T> {
  final Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}


/*

  // Converta _datamock para JSON string
    final data = _datamock.toJson();
    
    // Converta a string JSON para um mapa
    final actualJson = jsonDecode(data) as Map<String, dynamic>;

    // Converta o _jsonDataMock para JSON string e depois para um mapa
    final expectedJson = _jsonDataMock as Map<String, dynamic>;

    // Compare os mapas diretamente
    expect(actualJson, equals(expectedJson));


*/
