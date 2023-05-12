import 'package:flutter/material.dart';

class FriendsPage extends StatefulWidget {
  const FriendsPage({Key? key}) : super(key: key);

  @override
  State<FriendsPage> createState() => _FriendsPageState();
}

class _FriendsPageState extends State<FriendsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("_FriendsPageState"),
      ),
      body: const Center(
        child: Text("_FriendsPageState"),
      ),
    );
  }
}