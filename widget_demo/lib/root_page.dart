import 'package:flutter/material.dart';
import 'package:widget_demo/page/chat_page.dart';
import 'package:widget_demo/page/discover_page.dart';
import 'package:widget_demo/page/friends_page.dart';
import 'package:widget_demo/page/mine_page.dart';

class RootPage extends StatefulWidget {
  const RootPage({Key? key}) : super(key: key);

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {

  int _currentIndex = 3;

  final List<Widget> _pages = [const ChatPage(), const FriendsPage(), const DiscoverPage(), const MinePage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        // 不设置这个 只能三个 ...
        type: BottomNavigationBarType.fixed,
        fixedColor: Colors.green,
        currentIndex: _currentIndex,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: "微信"),
          BottomNavigationBarItem(icon: Icon(Icons.bookmark), label: "通讯录"),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: "发现"),
          BottomNavigationBarItem(icon: Icon(Icons.person_2_outlined), label: "我的"),
        ],
      ),
    );
  }
}
