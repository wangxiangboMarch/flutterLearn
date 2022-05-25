/// 使用 async 和 await 关键字可以让你避免回调地狱（Callback Hell）并使你的代码更具可读性
/// 
const oneSecond = Duration(seconds: 1);
// ···
Future<void> printWithDelay(String message) async {
  await Future.delayed(oneSecond);
  print(message);
}

// 上面的方法相当于
Future<void> printWithDelay1(String message) {
  return Future.delayed(oneSecond).then((_) {
    print(message);
  });
}