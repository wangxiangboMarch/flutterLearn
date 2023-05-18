import 'package:flutter/material.dart';

import 'discover/discover_cell.dart';

class MinePage extends StatefulWidget {
  const MinePage({Key? key}) : super(key: key);

  @override
  State<MinePage> createState() => _MinePagePageState();
}

class _MinePagePageState extends State<MinePage> {

  Widget headerWidget() {
    return Container(
      height: 128,
      color: Colors.greenAccent,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // 列表
          Container(
            child: MediaQuery.removePadding(
              removeTop: true,
                context: context,
                child: ListView(
                  children: [

                    headerWidget(),

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
          ),
          // 相机
          Container(
            margin: EdgeInsets.only(top: 40, right: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(Icons.accessibility_new)
              ],
            ),
          ),

        ],
      ),
    );
  }
}