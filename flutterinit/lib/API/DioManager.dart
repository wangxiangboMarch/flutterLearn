import 'dart:convert';

import 'package:dio/dio.dart';
import '../Model/BaseResponse.dart';
import '../Model/ErrorRes.dart';
import 'EntityFactory.dart';

typedef Success<T> = Function(List<T>? data); // 定义一个函数 请求成功回调
typedef Error = Function(ErrorRes errorRes); // 请求失败统一回调

/// dio配置类
class DioManager {
  static const baseUrl = "https://dtnb.16bus.net"; // 正式环境

  static DioManager instance = DioManager._internal();
  Dio? _dio;
  final Map<String, dynamic> _headers = {};

  final _connectTimeout = 5000; // 5s
  final _receiveTimeout = 0;

  // 单例 私有化构造初始化dio
  DioManager._internal() {
    if (_dio == null) {
      BaseOptions options = BaseOptions(
        /// Http method.
        method: 'post',

        /// 请求基地址,可以包含子路径，如: "https://www.google.com/api/".
        baseUrl: baseUrl,

        /// Http请求头.
        // Map<String, dynamic> headers;

        /// 连接服务器超时时间，单位是毫秒.
        connectTimeout: _connectTimeout,
        /// 2.x中为接收数据的最长时限.
        receiveTimeout: _receiveTimeout,

      /// 请求路径，如果 `path` 以 "http(s)"开始, 则 `baseURL` 会被忽略； 否则,
        /// 将会和baseUrl拼接出完整的的url.
        // String path = "";

        /// 请求的Content-Type，默认值是"application/json; charset=utf-8".
        /// 如果您想以"application/x-www-form-urlencoded"格式编码请求数据,
        /// 可以设置此选项为 `Headers.formUrlEncodedContentType`,  这样[Dio]
        /// 就会自动编码请求体.
        // String contentType;

        /// [responseType] 表示期望以那种格式(方式)接受响应数据。
        /// 目前 [ResponseType] 接受三种类型 `JSON`, `STREAM`, `PLAIN`.
        ///
        /// 默认值是 `JSON`, 当响应头中content-type为"application/json"时，dio 会自动将响应内容转化为json对象。
        /// 如果想以二进制方式接受响应数据，如下载一个二进制文件，那么可以使用 `STREAM`.
        ///
        /// 如果想以文本(字符串)格式接收响应数据，请使用 `PLAIN`.
          responseType: ResponseType.json,

        /// `validateStatus` 决定http响应状态码是否被dio视为请求成功， 返回`validateStatus`
        ///  返回`true` , 请求结果就会按成功处理，否则会按失败处理.
        // ValidateStatus validateStatus;

        /// 用户自定义字段，可以在 [Interceptor]、[Transformer] 和 [Response] 中取到.
        // Map<String, dynamic> extra;

        /// Common query parameters
        // Map<String, dynamic /*String|Iterable<String>*/ > queryParameters;

        /// 请求数据中数组的编码的方式，具体可以参考CollectionFormat的定义
        // late CollectionFormat collectionFormat;
      );
      _dio = Dio(options);

      /// 正式环境拦截日志打印
      if (!const bool.fromEnvironment("dart.vm.product")) {
        _dio?.interceptors
            .add(LogInterceptor(requestBody: true, responseBody: true));
      }
    }
  }

  get header => _headers;

  /// 更新header
  updateHeader() {
    _dio?.options.headers = _headers;
  }

  /// 请求，返回的渲染数据 T
  /// path：请求地址
  /// params：请求参数
  /// success：请求成功回调
  /// error：请求失败回调
  void request<T>(String path, bool hasLoading ,Map<String, dynamic>? params,
      Success<T>? success, Error? error) async {

    try {
      Response? response = await _dio?.request(
        path,
        data: params,
      );
      if (response?.statusCode == 200) {

        // BaseRes<T> baseResult = BaseRes.fromJson(response?.data, (js) => EntityFactory.generateOBJ(js));
        BaseRes<List<T>> baseResult = BaseRes<List<T>>.fromJson(response?.data, (js) {

          List<Map<String, dynamic>> listMap = List<Map<String, dynamic>>.from(js);

          return listMap.map((e) {
            return EntityFactory.generateOBJ<T>(e);
          }).toList();
        } );
        // 对象数据结构
        if (baseResult.code == "0" && baseResult.data != null) {
          if (success != null) success(baseResult.data);
        } else {
          if (error != null) {
            error(ErrorRes(baseResult.code as int, DioErrorType.other));
          }
        }
      }else{
        if (error != null) {
          error(ErrorRes(-1000, DioErrorType.other));
        }
      }
    } catch(e) {
      if (error != null) {
        error(ErrorRes(-1000, DioErrorType.other));
      }
    }
  }
}

