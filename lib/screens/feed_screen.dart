import 'package:flutter/material.dart';
import 'package:test_for_job/screens/create_post.dart';
import 'package:test_for_job/widgets/feed_items.dart';

class FeedScreen extends StatelessWidget {
  final String feedType;
  final List<Post> posts;

  FeedScreen({required this.feedType, required this.posts});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        // Space for the refresh logic as you people said in the google form
        await Future.delayed(Duration(seconds: 2));
      },
      child: ListView.builder(
        itemCount: posts.length,
        itemBuilder: (context, index) {
          final post = posts[index];
          return FeedItem(
            username: 'User',
            timeAgo: 'Just now',
            topicName: post.topic,
            content: post.content,
            image: post.image,
          );
        },
      ),
    );
  }
}