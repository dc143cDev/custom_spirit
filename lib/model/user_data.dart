import 'package:http/http.dart' as http;
import 'dart:convert';

class getUser {
  final String url;
  getUser(this.url);

  Future<dynamic> getUserData() async {
    var url = Uri.parse('http://localhost:8000/get');
    http.Response response = await http.get(url);
    var userJson = response.body;
    var parsingData = jsonDecode(userJson);
    return parsingData;
  }
}
