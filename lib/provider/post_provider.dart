import 'package:flutter/cupertino.dart';
import "package:http/http.dart" as http;
import 'dart:convert' as convert;

import '../models/post.dart';
import '../models/user.dart';

class PostProvider extends ChangeNotifier {
  PostProvider();

  String baseUrl = "https://jsonplaceholder.typicode.com";

  List<User>? _users;
  List<User>? get users => _users;

  List<Post>? _posts;
  List<Post>? get posts => _posts;

  ///Getting all users data
  getUsers() async {
    var uri = Uri.parse(baseUrl + '/users');
    Map<String, String> header = {
      'Content-Type': 'application/json',
      'Charset': 'utf-8',
      "Accept": "application/json",
    };
    var response = await http.get(uri, headers: header);
    _users = [];
    if (response.statusCode == 200) {
      var json = convert.jsonDecode(response.body);

      json.forEach((element) {
        _users!.add(User.fromJson(element));
      });
    }
  }

  ///Getting all post data
  getAllPost() async {
    var uri = Uri.parse(baseUrl + '/posts');
    Map<String, String> header = {
      'Content-Type': 'application/json',
      'Charset': 'utf-8',
      "Accept": "application/json",
    };
    var response = await http.get(uri, headers: header);
    _posts = [];
    if (response.statusCode == 200) {
      var json = convert.jsonDecode(response.body);

      json.forEach((element) {
        User user = users!.firstWhere((u) => u.id == element['userId']);
        _posts!.add(Post.fromJson(element, user));
      });
    }
    notifyListeners();
  }
}
