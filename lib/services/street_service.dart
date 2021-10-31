import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:tidii/models/street.dart';

class StreetService {
  Future<List<Street>> fetchDistrict(int districtId) async {
    final response = await http
        .get(Uri.parse('http://10.0.0.106:8080/streets/district/$districtId'));

    if (response.statusCode != 200) {
      throw Exception('Error');
    }
    
    Iterable l = json.decode(response.body);
    List<Street> streets = List<Street>.from(l.map((street) => Street.fromJson(street)));

    return streets;
  }
}
