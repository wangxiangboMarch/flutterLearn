import 'package:json_annotation/json_annotation.dart';

part 'BaseResponse.g.dart';
/// 响应数据头数据统一管理
@JsonSerializable(explicitToJson: true, genericArgumentFactories: true)
class BaseRes<T> {
  final String code;// 状态码
  final String message; // 状态码说明
  final T? data; // 渲染数据

  BaseRes({required this.code, required this.message, this.data});

  /// A necessary factory constructor for creating a new User instance
  /// from a map. Pass the map to the generated `_$UserFromJson()` constructor.
  /// The constructor is named after the source class, in this case, User.
  factory BaseRes.fromJson(
      Map<String, dynamic> json, T Function(dynamic json) fromJsonT) =>
      _$BaseResFromJson(json, fromJsonT);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$UserToJson`.
  Map<String, dynamic> toJson(Object? Function(T value) toJsonT) => _$BaseResToJson(this, toJsonT);
}

/// const json = "{\"code\": \"0\",\"message\": \"请求成功\",\"data\": {\"title\": \"请问外环路怎么走？\",\"scores_num\": 9}}";


/// 使用 json_serializable 模型

/// Map<String, dynamic> jsonObject = jsonDecode(json);
/// BaseRes<Demo> baseResult = BaseRes.fromJson(jsonObject, (js) => Demo.fromJson(js));

/// print(baseResult.message);

/// Map<String, dynamic> hah = baseResult.toJson((js) => js.toJson());

/// print(jsonEncode(hah));