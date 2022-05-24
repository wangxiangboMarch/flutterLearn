// import 'package:dio/dio.dart';
//
// ///拦截器 数据初步处理
// class RequestInterceptor extends InterceptorsWrapper {
//   //请求后 成功走这里
//   @override
//   void onResponse(Response response, ResponseInterceptorHandler handler) {
//     EasyLoading.dismiss();
//     if (response.statusCode == 200) {
//       //访问正确有返回值的情况
//       if (response.data is Map) {
//         //将数据脱壳需要返回自己的数据
//         ResponseData responseData = ResponseData.fromJson(response.data);
//         if (responseData.success) {
//           response.data = responseData.data;
//           response.statusCode = responseData.respCode;
//           response.statusMessage = responseData.respDesc;
//           return handler.resolve(response);
//         }
//         return handler.resolve(response);
//       } else if (response.data is String) {
//         //  {"respCode":403,"respDesc":"非法访问"}
//         ResponseError model = ResponseError.fromJson(jsonDecode(response.data));
//         response.statusCode = model.respCode;
//         if (model.respCode == 403 || model.respCode == 402) {
//           //做些什么
//           throwUnauthorizedError(response);
//         }else{
//           throwError(response);
//         }
//       } else {
//         throwError(response);
//       }
//     } else {
//       throwError(response);
//     }
//   }
//
//   @override
//   void onError(DioError err, ErrorInterceptorHandler handler) {
//     EasyLoading.dismiss();
//
//     throw DioError(
//         requestOptions: err.requestOptions,
//         type: err.type,
//         error: err,
//         response: err.response);
//   }
//
//   ///抛出异常 留给baseModel去统一处理
//   void throwError(Response<dynamic> response) {
//     throw DioError(
//         requestOptions: response.requestOptions,
//         error: ResponseException(errCode: response.statusCode));
//   }
// }
// ///鉴权错误
// void throwUnauthorizedError(Response<dynamic> response) {
//   throw DioError(
//       requestOptions: response.requestOptions,
//       error: UnauthorizedError(errCode: response.statusCode));
// }