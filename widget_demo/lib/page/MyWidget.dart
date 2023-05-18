
import 'package:flutter/material.dart';
import '../model/car.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});


  Widget _loadList(BuildContext context, int index) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            datas[index].imageUrl,
            // height: 128,
            fit: BoxFit.fitWidth,
          ),
          Text(datas[index].name),
        ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
        appBar: AppBar(
          // backgroundColor: _themeColor,
          // 为安卓特性设置
          // centerTitle: true,
          title: const Text("woshi tong "),
          // 导航栏底部的那根线
          elevation: 0.0,
        ),
        body: ListView.builder(
          itemBuilder: _loadList,
          itemCount: datas.length,
        ),
      ),
    );
  }
}

final List<Car> datas = [

  const Car("mioaxiaotong", "http://cdn.xiangbo.wang/2022/12/maoxiaotong00001.jpeg"),
  const Car("mioaxiaotong", "http://cdn.xiangbo.wang/2022/12/maoxiaotong00002.jpeg"),
  const Car("mioaxiaotong", "http://cdn.xiangbo.wang/2022/12/maoxiaotong00003.jpeg"),
  const Car("mioaxiaotong", "http://cdn.xiangbo.wang/2022/12/maoxiaotong00004.jpeg"),
  const Car("mioaxiaotong", "http://cdn.xiangbo.wang/2022/12/maoxiaotong00005.jpeg"),
  const Car("mioaxiaotong", "http://cdn.xiangbo.wang/2022/12/maoxiaotong00006.jpeg"),
  const Car("mioaxiaotong", "http://cdn.xiangbo.wang/2022/12/maoxiaotong00007.jpeg"),
  const Car("mioaxiaotong", "http://cdn.xiangbo.wang/2022/12/maoxiaotong00008.jpeg"),
  const Car("mioaxiaotong", "http://cdn.xiangbo.wang/2022/12/maoxiaotong00009.jpeg"),
  const Car("mioaxiaotong", "http://cdn.xiangbo.wang/2022/12/maoxiaotong00010.jpeg"),
  const Car("mioaxiaotong", "http://cdn.xiangbo.wang/2022/12/maoxiaotong00011.jpeg"),
  const Car("mioaxiaotong", "http://cdn.xiangbo.wang/2022/12/maoxiaotong00012.jpeg"),
  const Car("mioaxiaotong", "http://cdn.xiangbo.wang/2022/12/maoxiaotong00013.jpeg"),
  const Car("mioaxiaotong", "http://cdn.xiangbo.wang/2022/12/maoxiaotong00014.jpeg"),
  const Car("mioaxiaotong", "http://cdn.xiangbo.wang/2022/12/maoxiaotong00015.jpeg"),
  const Car("mioaxiaotong", "http://cdn.xiangbo.wang/2022/12/maoxiaotong00016.jpeg"),
  const Car("mioaxiaotong", "http://cdn.xiangbo.wang/2022/12/maoxiaotong00017.jpeg"),
  const Car("mioaxiaotong", "http://cdn.xiangbo.wang/2022/12/maoxiaotong00018.jpeg"),
  const Car("mioaxiaotong", "http://cdn.xiangbo.wang/2022/12/maoxiaotong00019.jpeg"),
  const Car("mioaxiaotong", "http://cdn.xiangbo.wang/2022/12/maoxiaotong00020.jpeg"),
  const Car("mioaxiaotong", "http://cdn.xiangbo.wang/2022/12/maoxiaotong00021.jpeg"),
  const Car("mioaxiaotong", "http://cdn.xiangbo.wang/2022/12/maoxiaotong00022.jpeg"),
  const Car("mioaxiaotong", "http://cdn.xiangbo.wang/2022/12/maoxiaotong00023.jpeg"),
  const Car("mioaxiaotong", "http://cdn.xiangbo.wang/2022/12/maoxiaotong00024.jpeg"),
  const Car("mioaxiaotong", "http://cdn.xiangbo.wang/2022/12/maoxiaotong00025.jpeg"),
  const Car("mioaxiaotong", "http://cdn.xiangbo.wang/2022/12/maoxiaotong00026.jpeg"),

  const Car("name", "http://cdn.xiangbo.wang/image/2.jpg"),
  const Car("name", "http://cdn.xiangbo.wang/image/3.jpg"),
  const Car("name", "http://cdn.xiangbo.wang/image/4.jpg"),
  const Car("name", "http://cdn.xiangbo.wang/image/5.jpg"),
  const Car("name", "http://cdn.xiangbo.wang/image/6.jpg"),
  const Car("name", "http://cdn.xiangbo.wang/image/7.jpg"),
  const Car("name", "http://cdn.xiangbo.wang/image/8.jpg"),
  const Car("name", "http://cdn.xiangbo.wang/image/9.jpg"),
  const Car("name", "http://cdn.xiangbo.wang/image/10.jpg"),
  const Car("name", "http://cdn.xiangbo.wang/image/11.jpg"),
  const Car("name", "http://cdn.xiangbo.wang/image/12.jpg"),
  const Car("name", "http://cdn.xiangbo.wang/image/13.jpg"),
  const Car("name", "http://cdn.xiangbo.wang/image/1.jpg"),
];