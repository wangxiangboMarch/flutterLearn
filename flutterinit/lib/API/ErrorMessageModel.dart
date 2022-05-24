// import 'package:dio/dio.dart';
//
// ///格式化Dio返回的Error
// ///[e] catch到的error
// static ErrorMessageModel dioErrorFormat(e) {
// int? errorCode;
// StateErrorType errorType = StateErrorType.defaultError;
// String errMsg = "网络离家出走了~";
// //判断一下抛出的异常是不是DIO包裹的异常
// if (e is DioError) {
// //是不是各种超时
// if (e.type == DioErrorType.receiveTimeout ||
// e.type == DioErrorType.sendTimeout ||
// e.type == DioErrorType.receiveTimeout) {
// errorType = StateErrorType.networkTimeoutError;
// errMsg = "连接超时了";
// } else if (e.type == DioErrorType.response) {
// //访问出的各种错 访问中statusCode是400/500代码都会走到这里 如果想详细展示具体是什么错误可以继续细分
// errorType = StateErrorType.responseException;
// errMsg = _getNumberMeans(e);
// } else if (e.type == DioErrorType.cancel) {
// //如果是取消访问了走这里
// errMsg = e.message;
// } else {
// //这里是刚才DIOerror包裹的自定义错误
// // 这里由于没有定义error.type所以用error的类型判断
// dynamic otherError = e.error;
// dynamic otherE;
// if (otherError is DioError) {
// otherE = otherError.error;
// }
// if (otherE is ResponseException) {
// errorType = StateErrorType.responseException;
// errMsg = otherE.errorMessage ?? "";
// errorCode = otherE.errorCode;
// } else if (otherE is SocketException) {
// errorType = StateErrorType.networkTimeoutError;
// errMsg = "网络无连接,请检查网络设置";
// } else {
// errorType = StateErrorType.defaultError;
// errMsg = "网络无连接,请检查网络设置";
// }
// }
// } else {
// errorType = StateErrorType.defaultError;
// errMsg = "出问题了~~~";
// }
// return ErrorMessageModel(
// errorType: errorType, message: errMsg, errorCode: errorCode);
// }
//
//
// class ErrorMessageModel {
//   StateErrorType? errorType;
//   String? message;
//   int? errorCode;
//
//   ErrorMessageModel({
//     this.errorType = StateErrorType.defaultError,
//     this.message = "出错啦,请稍后重试~",
//     this.errorCode,
//   });
//
//   ErrorMessageModel.fromJson(Map<String, dynamic> json) {
//     errorType = json['errorType'];
//     message = json['message'];
//     errorCode = json['errorCode'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = {};
//     data['errorType'] = errorType;
//     data['message'] = message;
//     data['errorCode'] = errorCode;
//     return data;
//   }
// }
