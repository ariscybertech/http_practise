import 'dart:convert';

import 'package:http/http.dart' as http;
Future<Map<String, dynamic>> getPosts() async {
    var result = await http.get(Uri.parse('https://py.dwed.biz/v1.0/api/streaming/tmeduz/'));
    return json.decode(result.body);
}