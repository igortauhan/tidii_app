class Street {
  int id;
  String name;
  String info;
  bool leakingSituation;

  Street({
    required this.id,
    required this.name,
    required this.info,
    required this.leakingSituation
  });

  factory Street.fromJson(Map<String, dynamic> json) {
    return Street(
        id: json['id'],
        name: json['name'],
        info: json['info'],
        leakingSituation: json['leakingSituation']);
  }
}
