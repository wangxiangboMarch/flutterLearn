// 级联
// 要对同一对象执行一系列操作，请使用级联（..）。我们都看到过这样的表达式
/// myObject.someMethod()
/// 它在 myObject 上调用 someMethod 方法，而表达式的结果是 someMethod 的返回值
/// 
/// 
/// myObject..someMethod()
/// 虽然它仍然在 myObject 上调用了 someMethod，
/// 但表达式的结果却不是该方法返回值，而是是 myObject 对象的引用！
/// 

// var button = querySelector('#confirm');
// button?.text = 'Confirm';
// button?.classes.add('important');
// button?.onClick.listen((e) => window.alert('Confirmed!'));

// 使用级联后

// querySelector('#confirm')
//   ?..text = 'Confirm'
//   ..classes.add('important')
//   ..onClick.listen((e) => window.alert('Confirmed!'));