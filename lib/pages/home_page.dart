import 'package:cyient_assignment/provider/post_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/post.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    Provider.of<PostProvider>(context, listen: false)
      ..getUsers()
      ..getAllPost();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Selector<PostProvider, List<Post>?>(
        shouldRebuild: (prev, next) => true,
        selector: (context, postProvider) => postProvider.posts,
        builder: (context, posts, _) {
          if (posts == null) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (posts.isEmpty) {
            return const Center(
              child: Text("No Post found"),
            );
          } else {
            return ListView.builder(
              itemCount: posts.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(posts[index].title),
                  subtitle: Text(posts[index].user.name),
                );
              },
            );
          }
        },
      ),
    );
  }
}
