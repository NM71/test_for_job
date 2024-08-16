import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class CreatePostScreen extends StatefulWidget {
  final Function(Post) onPostCreated;

  CreatePostScreen({required this.onPostCreated});

  @override
  _CreatePostScreenState createState() => _CreatePostScreenState();
}

class _CreatePostScreenState extends State<CreatePostScreen> {
  bool isPublic = true;
  String selectedTopic = 'Climate Change & Sustainability';
  String postContent = '';
  File? image;

  final topics = ['Climate Change & Sustainability', 'Conscious Art', 'Other Topics...'];

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        image = File(pickedFile.path);
      });
    }
  }

  void _createPost() {
    final newPost = Post(
      isPublic: isPublic,
      topic: selectedTopic,
      content: postContent,
      image: image,
    );
    widget.onPostCreated(newPost);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffffffff),
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context),
          ),
          title: Text('Create Post'),
          centerTitle: true,
          actions: [
            TextButton(
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(Color(0xff5dc482)),
              ),
              onPressed: _createPost,
              child: Text('Post', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () => setState(() => isPublic = true),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: isPublic ? Color(0xff5dc482) : Color(0xffffffff),
                      ),
                      child: Text('Public', style: TextStyle(color: Colors.black)),
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () => setState(() => isPublic = false),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: isPublic ? Color(0xffffffff) : Color(0xff5dc482),
                      ),
                      child: Text('Business', style: TextStyle(color: Colors.black)),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              TextField(
                maxLines: 20,
                decoration: InputDecoration(
                  hintText: 'Type something....',
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) => setState(() => postContent = value),
              ),
              SizedBox(height: 16),
              Text('Topic', style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(height: 8),
              Wrap(
                spacing: 8,
                children: topics.map((topic) => ChoiceChip(
                  label: Text(topic),
                  selected: selectedTopic == topic,
                  onSelected: (selected) {
                    if (selected) {
                      setState(() => selectedTopic = topic);
                    }
                  },
                )).toList(),
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.camera_alt),
                    onPressed: () => _pickImage(ImageSource.camera),
                  ),
                  IconButton(
                    icon: Icon(Icons.photo),
                    onPressed: () => _pickImage(ImageSource.gallery),
                  ),
                ],
              ),
              if (image != null) ...[
                SizedBox(height: 16),
                Image.file(image!, height: 200),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

class Post {
  final bool isPublic;
  final String topic;
  final String content;
  final File? image;

  Post({required this.isPublic, required this.topic, required this.content, this.image});
}