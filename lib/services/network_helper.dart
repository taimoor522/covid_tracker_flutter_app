import 'package:http/http.dart' as http;
import 'dart:convert';

class Httphelper {
  static Future<dynamic> get(String _uri) async {
    var url = Uri.parse(_uri);
    var response = await http.get(url);
    if (response.statusCode == 200) {
      return json.decode(response.body);
    }
  }
}
