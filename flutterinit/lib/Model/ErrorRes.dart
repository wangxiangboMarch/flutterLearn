

import 'package:dio/dio.dart';

class ErrorRes {
  final DioErrorType type;
  final int code;

  ErrorRes(this.code, this.type);

  String errorDes() {
    String errMsg = "";
    switch (type) {
      case DioErrorType.receiveTimeout :
        errMsg = "连接超时了";
        return errMsg;
      case DioErrorType.sendTimeout:
        errMsg = "连接超时了";
        return errMsg;
      case DioErrorType.response:
        errMsg = "连接超时了...";
        return errMsg;
      default:
        errMsg = "网络离家出走了~";
        return errMsg;
    }
  }
}
