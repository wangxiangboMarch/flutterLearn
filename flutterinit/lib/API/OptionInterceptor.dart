// //Option拦截器可以用来统一处理Option信息 可以在这里添加
// import 'package:dio/dio.dart';
// import 'package:flutter/cupertino.dart';
//
// class OptionInterceptor extends InterceptorsWrapper {
//   @override
//   void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
//     //在请求发起前修改头部
//     // options.headers["token"] = "11111";
//     ///请求的Content-Type，默认值是"application/json; charset=utf-8".
//     /// 如果您想以"application/x-www-form-urlencoded"格式编码请求数据,
//     options.contentType=Headers.formUrlEncodedContentType;
//     ///如果你的headers是固定的你可以在BaseOption中设置,如果不固定可以在这里进行根据条件设置
//     options.headers["apiToken"] = "111222154546";
//     options.headers["user-token"]=CacheUtil().getJson(SPName.userInfo)!["userToken"];
//     String? mainUrl = CacheUtil().get<String>(SPName.mainUrl);
//     //修改地址
//     //如果需要改变主地址可以在这里设置
//     if (StringUtil.isNotEmpty(mainUrl)) {
//       options.baseUrl = mainUrl!;
//     } else {
//       options.baseUrl = NetworkConfig.baseUrl;
//     }
//     //开发阶段可以把地址带参数打印出来方便校验结果
//     debugPrint(
//         "request:${options.method}\t url-->${options.baseUrl}${options.path}?${FormatUtil.formattedUrl(options.queryParameters)}");
//
//     if (options.queryParameters["hideLoading"] != true) {
//       EasyLoading.show();
//     }
// // 一定要加上这句话 否则进入不了下一步
//     return handler.next(options);
//   }
// }
//
// ///格式化url,将post和get请求以get链接输出
// static String formattedUrl(params) {
// var urlParamsStr = "";
// if (params?.isNotEmpty ?? false) {
// var tempArr = [];
// params.forEach((k, v) {
// tempArr.add(k + '=' + v.toString());
// });
// urlParamsStr = tempArr.join('&');
// }
// return urlParamsStr;
// }