import 'dart:io';
import 'package:flutter/material.dart';

class FeedItem extends StatelessWidget {
  final String username;
  final String timeAgo;
  final String topicName;
  final String content;
  final File? image;

  FeedItem({
    required this.username,
    required this.timeAgo,
    required this.topicName,
    required this.content,
    this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(0xffecf3f6),
      margin: EdgeInsets.all(8),
      child: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage('assets/profile.png'),
                ),
                SizedBox(width: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(username, style: TextStyle(fontWeight: FontWeight.bold)),
                    Text(topicName),
                    Text(timeAgo, style: TextStyle(color: Colors.grey)),
                  ],
                ),
                Spacer(),
                IconButton(icon: Icon(Icons.more_vert), onPressed: () {}),
              ],
            ),
            SizedBox(height: 8),
            Text(content),
            if (image != null) ...[
              SizedBox(height: 8),
              Image.file(image!),
            ],
            SizedBox(height: 8),
            Row(
              children: [
                IconButton(icon: Icon(Icons.favorite_border), onPressed: () {}),
                IconButton(icon: Icon(Icons.chat_bubble_outline), onPressed: () {}),
                IconButton(icon: Icon(Icons.share), onPressed: () {}),
                if (image != null) IconButton(icon: Icon(Icons.bookmark_border), onPressed: () {}),
              ],
            ),
          ],
        ),
      ),
    );
  }
}