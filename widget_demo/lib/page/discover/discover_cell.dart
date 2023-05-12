import 'package:flutter/material.dart';

import '../MyWidget.dart';

class DiscoverCell extends StatelessWidget {
  // const DiscoverCell({Key? key}) : super(key: key);
  final String title;
  final String subTitle;
  final String? imageName;
  final String? subImageName;

  const DiscoverCell({super.key,
    required this.title,
    required this.subTitle,
    this.imageName,
    this.subImageName})
   : assert(title != null, "Title is null"),
        assert( subTitle != null, "subtitle is null");

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // 点击事件
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder:
          (BuildContext context) => MyWidget()
          )
        );
      },
      child: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: const Row(
                children: [
                  Icon(Icons.chat),
                  Text("data")
                ],
              ),
            ),
            Container(
              child: Text("data"),
            )
          ],
        ),
      ),
    );
  }
}
