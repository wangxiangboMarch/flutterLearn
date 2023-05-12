import 'package:flutter/material.dart';
import 'package:widget_demo/page/discover/discover_cell.dart';

class DiscoverPage extends StatefulWidget {
  const DiscoverPage({Key? key}) : super(key: key);

  @override
  State<DiscoverPage> createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> {

  final Color _themeColor = const Color.fromRGBO(200,200,200,1.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: _themeColor,
        // 为安卓特性设置
        centerTitle: true,
        title: const Text("发现"),
        // 导航栏底部的那根线
        elevation: 0.0,
      ),
      body: Container(
        color: _themeColor,
        child: ListView(
          children: [
            const DiscoverCell(title: "title", subTitle: "subTitle"),
            // 分割线
            Row(
              children: <Widget>[
                Container(
                  width: 50,
                  height: 0.5,
                  color: Colors.white,
                ),
                Container(
                  height: 0.5,
                  color: Colors.grey,
                )
              ],
            ),
            const DiscoverCell(title: "title", subTitle: "subTitle"),
            // 间距
            const SizedBox(
              height: 10,
            ),
            const DiscoverCell(title: "title", subTitle: "subTitle"),
          ],
        ),
      ),
    );
  }
}