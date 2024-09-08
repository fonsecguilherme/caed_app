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
  final String message;

  Status({
    required this.hour,
    required this.date,
    required this.message,
  });

  factory Status.fromJson(String str) => Status.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Status.fromMap(Map<String, dynamic> json) => Status(
        hour: json["hour"],
        date: json["date"],
        message: json["message"],
      );

  Map<String, dynamic> toMap() => {
        "hour": hour,
        "date": date,
        "message": message,
      };
}
