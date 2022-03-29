import 'package:cyient_assignment/models/user.dart';

class Post {
  final int userId;
  final int id;
  final String title;
  final String body;
  User user;

  Post(this.userId, this.id, this.title, this.body, this.user);

  factory Post.fromJson(Map<String, dynamic> json, User user) {
    return Post(
      json['userId'],
      json['id'],
      json['title'],
      json['body'],
      user,
    );
  }
}
