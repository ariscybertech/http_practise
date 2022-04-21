import 'dart:convert';

import 'package:http/http.dart' as http;
Future<Map<String, dynamic>> getPosts() async {
    var result = await http.get(Uri.parse('https://py.dwed.biz/v1.0/api/streaming/tmeduz/'));
    return json.decode(result.body);
}

Future<List<dynamic>> getInfoData() async {
  String url = 'https://py.dwed.biz/v1.0/api/streaming/';
  var response = await http.get(Uri.parse(url), headers: {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  });
  return json.decode(response.body)['results'];
}