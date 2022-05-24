// import 'package:dio/dio.dart';
//
// /// dio配置类
// class DioManager {
//
//   static const baseUrl = "https://xxx"; // 正式环境
//
//   static DioManager instance = DioManager._internal();
//   Dio? _dio;
//   final Map<String, dynamic> _headers = {};
//
//
//   // 单例 私有化构造初始化dio
//   DioManager._internal() {
//     if (_dio == null) {
//       BaseOptions options = BaseOptions(
//           baseUrl: baseUrl,
//           contentType: Headers.jsonContentType,
//           responseType: ResponseType.json,
//           receiveDataWhenStatusError: false,
//           connectTimeout: _connectTimeout,
//           receiveTimeout: _receiveTimeout,
//           headers: _headers);
//       _dio = Dio(options);
//
//       /// 正式环境拦截日志打印
//       if (!const bool.fromEnvironment("dart.vm.product")) {
//         _dio?.interceptors
//             .add(LogInterceptor(requestBody: true, responseBody: true));
//       }
//
//
//       Future<Uint8List> imageToBytes(String imageUrl) async {
//         var response = await _dio?.get(imageUrl,
//             options: Options(responseType: ResponseType.bytes));
//         return Uint8List.fromList(response?.data);
//       }
//
//       get header => _headers;
//
//       /// 更新header
//       updateHeader() {
//         _dio?.options.headers = _headers;
//       }
//       /// 请求，返回的渲染数据 T
//       /// method：请求方法，NWMethod.GET等
//       /// path：请求地址
//       /// params：请求参数
//       /// success：请求成功回调
//       /// error：请求失败回调
//       Future request<T>(Method method, String path,
//           {String? baseUrl,
//             Map<String, dynamic>? params,
//             data,
//             ProgressCallback? onSendProgress, // 上传数据进度
//             ProgressCallback? onReceiveProgress, // 接受数据进度
//             Success<T>? success,
//             Function(ErrorRes)? error}) async {
//         try {
//           var connectivityResult = await (Connectivity().checkConnectivity());
//
//           if (connectivityResult == ConnectivityResult.none) {
//             if (error != null) {
//               error(ErrorRes(code: -9, message: "网络异常~,请检查您的网络状态!"));
//             }
//             return;
//           }
//           _setBaseUrl(baseUrl); // 动态设置baseUrl
//           Response? response = await _dio?.request(
//             path,
//             queryParameters: params,
//             data: data,
//             onSendProgress: onSendProgress,
//             onReceiveProgress: onReceiveProgress,
//             options: Options(method: methodValues[method]),
//           );
//           if (response != null) {
//             BaseRes entity = BaseRes<T>.fromJson(response.data);
//             // 对象数据结构
//             if (entity.code == 200 && entity.data != null) {
//               if (success != null) success(entity.data);
//             } else {
//               if (error != null) {
//                 error(ErrorRes(code: entity.code, message: entity.message));
//               }
//             }
//           } else {
//             if (error != null) error(ErrorRes(code: -1, message: "未知错误"));
//           }
//         } on DioError catch (e) {
//           if (error != null) error(createErrorEntity(e));
//         }
//       }