import 'package:flutter/material.dart';

class MinePage extends StatefulWidget {
  const MinePage({Key? key}) : super(key: key);

  @override
  State<MinePage> createState() => _MinePagePageState();
}

class _MinePagePageState extends State<MinePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("_MinePagePageState"),
      ),
      body: Center(
        child: Text("_MinePagePageState"),
      ),
    );
  }
}