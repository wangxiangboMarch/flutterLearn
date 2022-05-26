// 每次添加新的Json类都要在这里调用.fromJson方法
import '../Model/News.dart';

class EntityFactory {
  static T generateOBJ<T>(json) {
    if (T.toString() == "News\$") {
      return News.fromJson(json) as T;
    } else {
      return News.fromJson(json) as T;
    }
  }
}
