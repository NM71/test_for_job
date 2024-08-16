import 'package:flutter/material.dart';

class MessagesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Message'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              // Implement new message functionality
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: 5, // Arbitrary number for demonstration
        itemBuilder: (context, index) {
          return MessageListItem(
            name: 'Bruno Pham',
            message: 'Hello, I really like your post about...',
            time: '2 mins ago',
            unreadCount: 5,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ConversationScreen()),
              );
            },
          );
        },
      ),
    );
  }
}

class MessageListItem extends StatelessWidget {
  final String name;
  final String message;
  final String time;
  final int unreadCount;
  final VoidCallback onTap;

  MessageListItem({
    required this.name,
    required this.message,
    required this.time,
    required this.unreadCount,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: AssetImage('assets/profile.png'),
      ),
      title: Text(name, style: TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(message, maxLines: 1, overflow: TextOverflow.ellipsis),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(time, style: TextStyle(fontSize: 12)),
          SizedBox(height: 4),
          if (unreadCount > 0)
            Container(
              padding: EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: Colors.green,
                shape: BoxShape.circle,
              ),
              child: Text(
                unreadCount.toString(),
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
            ),
        ],
      ),
      onTap: onTap,
    );
  }
}

class ConversationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bruno Pham'),
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {
            },
          ),
        ],
      ),
      body: Center(
        child: Text('Conversation screen'),
      ),
    );
  }
}