import 'package:json_annotation/json_annotation.dart';

part 'News.g.dart';

// 为了得到正常的输出，你需要在类声明之前在 @JsonSerializable 方法加入 explicitToJson: true
@JsonSerializable()
class News {
  // 如果需要，你可以很轻易地自定义命名策略。例如，如果 API 返回带有 蛇形命名方式 的对象，
  // 并且你想要在你的模型里使用 小驼峰 的命名方式，你可以使用带有一个 name 参数的 @JsonKey 注解。
  // @JsonKey(name: 'registration_date_millis')
  /// Tell json_serializable to use "defaultValue" if the JSON doesn't
  /// contain this key or if the value is `null`.
  // @JsonKey(defaultValue: false)

  /// When `true` tell json_serializable that JSON must contain the key,
  /// If the key doesn't exist, an exception is thrown.
  // @JsonKey(required: true)

  /// When `true` tell json_serializable that generated code should
  /// ignore this field completely.
  // @JsonKey(ignore: true)

  /// 消息id
  final String id;
  /// 发布时间
  final String publishTime;
  /// 标题
  final String title;
  /// 子标题
  final String subTitle;
  /// 正方形图 模块的标题名称
  final String image;
  /// banner长图
  final String rectangleImage;
  /// 链接
  final String url;
  /// 标签图片  0无  1 置顶
  final String tagImage;
  /// 阅读数量
  final String readCount;

  News(this.id, this.publishTime, this.title, this.subTitle, this.image, this.rectangleImage, this.url, this.tagImage, this.readCount);

  /// A necessary factory constructor for creating a new User instance
  /// from a map. Pass the map to the generated `_$UserFromJson()` constructor.
  /// The constructor is named after the source class, in this case, User.
  factory News.fromJson(Map<String, dynamic> json) => _$NewsFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$UserToJson`.
  Map<String, dynamic> toJson() => _$NewsToJson(this);

}

/// 使用 json_serializable 模型
///
/// Map<String, dynamic> userMap = jsonDecode(jsonString);
/// var user = User.fromJson(userMap);
///
/// 编码也是如此。调用 API 和以前一样。
/// String json = jsonEncode(user);