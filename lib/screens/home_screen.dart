// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:test_for_job/screens/create_post.dart';
// import 'package:test_for_job/screens/feed_screen.dart';
//
// class HomeScreen extends StatefulWidget {
//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
//   late TabController _tabController;
//   int _currentIndex = 0;
//   List<Post> posts = [];
//
//   @override
//   void initState() {
//     super.initState();
//     _tabController = TabController(length: 2, vsync: this);
//   }
//
//   @override
//   void dispose() {
//     _tabController.dispose();
//     super.dispose();
//   }
//
//   void _addPost(Post newPost) {
//     setState(() {
//       posts.insert(0, newPost);
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color(0xffffffff),
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         title: Row(
//           children: [
//             Text('CHANCE', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
//             SizedBox(width: 8),
//             Image(image: AssetImage('assets/tick-mark.png',),height: 20, width: 20,)
//           ],
//         ),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.notifications_none, color: Colors.black),
//             onPressed: () {},
//           ),
//         ],
//         bottom: TabBar(
//           controller: _tabController,
//           labelColor: Colors.green,
//           unselectedLabelColor: Colors.grey,
//           tabs: [
//             Tab(text: 'Public Feed'),
//             Tab(text: 'Business Feed'),
//           ],
//         ),
//       ),
//       body: TabBarView(
//         controller: _tabController,
//         children: [
//           FeedScreen(feedType: 'Public', posts: posts.where((p) => p.isPublic).toList()),
//           FeedScreen(feedType: 'Business', posts: posts.where((p) => !p.isPublic).toList()),
//         ],
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         backgroundColor: Color(0xffffffff),
//         currentIndex: _currentIndex,
//         onTap: (index) {
//           if (index == 2) {
//             Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context) => CreatePostScreen(onPostCreated: _addPost)),
//             );
//           } else {
//             setState(() {
//               _currentIndex = index;
//             });
//           }
//         },
//         items: [
//           BottomNavigationBarItem(icon: Icon(Icons.home, color: Color(0xff5dc482),), label: 'Home'),
//           BottomNavigationBarItem(icon: Icon(Icons.search, color: Color(0xff5dc482),), label: 'Search'),
//           BottomNavigationBarItem(icon: Icon(Icons.add, color: Color(0xff5dc482),), label: 'Create'),
//           BottomNavigationBarItem(icon: Icon(Icons.chat, color: Color(0xff5dc482),), label: 'Chat'),
//           BottomNavigationBarItem(icon: Icon(Icons.person, color: Color(0xff5dc482),), label: 'Profile'),
//         ],
//         selectedItemColor: Colors.green,
//         unselectedItemColor: Colors.grey,
//         type: BottomNavigationBarType.fixed,
//       ),
//     );
//   }
// }







































import 'package:flutter/material.dart';
import 'package:test_for_job/screens/chat_screen.dart';
import 'package:test_for_job/screens/create_post.dart';
import 'package:test_for_job/screens/feed_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _currentIndex = 0;
  List<Post> posts = [];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _addPost(Post newPost) {
    setState(() {
      posts.insert(0, newPost);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffffff),
      appBar: _currentIndex != 3 ? AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          children: [
            Image(image: AssetImage('assets/logo_new.png'),height: 80, width: 100,),
            // Text('CHANCE', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
            SizedBox(width: 8),
            Image(image: AssetImage('assets/tick-mark.png',),height: 20, width: 20,),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications_none, color: Colors.black),
            onPressed: () {},
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          labelColor: Colors.green,
          unselectedLabelColor: Colors.grey,
          tabs: [
            Tab(text: 'Public Feed'),
            Tab(text: 'Business Feed'),
          ],
        ),
      ) : null,
      body: IndexedStack(
        index: _currentIndex,
        children: [
          TabBarView(
            controller: _tabController,
            children: [
              FeedScreen(feedType: 'Public', posts: posts.where((p) => p.isPublic).toList()),
              FeedScreen(feedType: 'Business', posts: posts.where((p) => !p.isPublic).toList()),
            ],
          ),
          Center(child: Text('Search Screen')),
          Center(child: Text('Create Post Screen')),
          MessagesScreen(),
          Center(child: Text('Profile Screen')),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xffffffff),
        currentIndex: _currentIndex,
        onTap: (index) {
          if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CreatePostScreen(onPostCreated: _addPost)),
            );
          } else {
            setState(() {
              _currentIndex = index;
            });
          }
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Create'),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Chat'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}