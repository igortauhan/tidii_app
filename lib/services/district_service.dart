import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:tidii/models/district.dart';

class DistrictService {

  Future<List<District>> fetchDistrict() async {
    final response =
        await http.get(Uri.parse('http://10.0.0.106:8080/districts'));

    if (response.statusCode != 200) {
      throw Exception('Error');
    }

    Iterable l = json.decode(response.body);
    List<District> districts = List<District>.from(l.map((district) => District.fromJson(district)));

    return districts;
  }
}
