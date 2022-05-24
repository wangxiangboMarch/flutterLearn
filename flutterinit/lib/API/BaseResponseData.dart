import '../Model/News.dart';

/// 响应数据头数据统一管理
class BaseRes<T> {
  String code;// 状态码
  String message; // 状态码说明
  T? data; // 渲染数据

  BaseRes({required this.code, required this.message, this.data});

  factory BaseRes.fromJson(json) {
    // json 渲染json数据
    try {
      if (json["code"] != null) {
        try {
          code = json["code"];
        } catch (e) {
          code = "-1";
        }
      } else {
        return BaseRes(code: "-1", message: "服务器开小差了~", data: null);
      }
      return BaseRes(
          code: json["code"] ?? -1,
          message: json["message"],
          data: BeanFactory.generateOBJ<T>(json["data"]));
    } catch (e) {
      return BaseRes(code: "-1", message: "服务器开小差了~", data: null);
    }
  }
}

/// 实体bean转化工厂类
class BeanFactory {
  static T? generateOBJ<T>(json) {
    //T.toString() 类名
    try {
      switch (T.toString()) {
        case "int":
          return json;
        case "bool":
          return json;
        case "String":
          return json;
        default:
        // 实体类序列化
          return News.formJson(json) as T;
      }
    } catch (e) {
      return null;
    }
  }
}