import 'package:flutter/cupertino.dart';
import "package:http/http.dart" as http;
import 'dart:convert' as convert;

class PostProvider extends ChangeNotifier {
  PostProvider();

  String baseUrl = "https://jsonplaceholder.typicode.com";

  getUsers() async {
    var uri = Uri.parse(baseUrl);
    // var uri = Uri.parse('$baseUrl?name=$userName');
    Map<String, String> header = {
      'Content-Type': 'application/json',
      'Charset': 'utf-8',
      "Accept": "application/json",
    };
    var response = await http.get(uri, headers: header);
    if (response.statusCode == 200) {
      var json = convert.jsonDecode(response.body) as Map<String, dynamic>;
    }
  }
}
