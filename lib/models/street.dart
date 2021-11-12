import 'package:intl/intl.dart';

class Street {
  int id;
  String name;
  String info;
  bool leakingSituation;
  DateTime leakingDate;

  Street({
    required this.id,
    required this.name,
    required this.info,
    required this.leakingSituation,
    required this.leakingDate,
  });

  factory Street.fromJson(Map<String, dynamic> json) {
    return Street(
        id: json['id'],
        name: json['name'],
        info: json['info'],
        leakingSituation: json['leakingSituation'],
        leakingDate: DateFormat('dd/MM/yyyy HH:mm').parse(json['leakingDate']));
  }
}
