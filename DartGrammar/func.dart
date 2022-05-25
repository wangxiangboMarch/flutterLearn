int fibonacci(int n) {
  if (n == 0 || n == 1) return n;
  return fibonacci(n - 1) + fibonacci(n - 2);
}

var result = fibonacci(20);

/// => (胖箭头) 简写语法用于仅包含一条语句的函数。该语法在将匿名函数作为参数传递时非常有用：
///
// flybyObjects.where((name) => name.contains('turn')).forEach(print);

// 注释

/// 这是一个文档注释。
/// 文档注释用于为库、类以及类的成员添加注释。
/// 像 IDE 和 dartdoc 这样的工具可以专门处理文档注释。

/* 也可以像这样使用单斜杠和星号的注释方式 */

String stringify(int x, int y) {
  // TODO('Return a formatted string here');
  return '$x' + ' ' + '$y';
}

void main(List<String> args) {
  print(stringify(2, 3));
}
