class District {
  final int id;
  final String name;
  final String info;
  final bool leakingSituation;

  District({
      required this.id,
      required this.name,
      required this.info,
      required this.leakingSituation
  });

  factory District.fromJson(Map<String, dynamic> json) {
    return District(
        id: json['id'],
        name: json['name'],
        info: json['info'],
        leakingSituation: json['leakingSituation']);
  }
}
