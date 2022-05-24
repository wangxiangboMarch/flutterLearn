// typedef Success<T> = Function(T data); // 定义一个函数 请求成功回调
// typedef Error = Function(ErrorRes errorRes); // 请求失败统一回调
// typedef SuccessList<T> = Function(List<T> data); // 请求数据data为[]集合
//
// /// 通用调用接口类
// class Http {
//   // 私有构造
//   Http._internal();
//
//   static Http instance = Http._internal();
//
//   /// get请求
//   /// baseUrl 切换baseUrl
//   /// params 参数
//   /// success 请求对象成功回调
//   /// successList 请求列表成功回调
//   /// error 错误回调
//   /// [isList] 请求的数据是否为List列表 默认对象
//   /// [isList]=true 请求data数据为[]list列表
//   void get<T>(String url,
//       {String? baseUrl,
//         Map<String, dynamic>? params,
//         Success<T>? success,
//         SuccessList<T>? successList,
//         Error? error,
//         bool isList = false}) {
//     if (isList) {
//       _requestList<T>(Method.get, url,
//           baseUrl: baseUrl, params: params, success: successList, error: error);
//     } else {
//       _request<T>(Method.get, url,
//           baseUrl: baseUrl, params: params, success: success, error: error);
//     }
//   }
//
//   /// post请求
//   /// baseUrl 切换baseUrl
//   /// params 参数
//   /// data 上传表单数据 formData
//   /// success 请求对象成功回调
//   /// successList 请求列表成功回调
//   /// error 错误回调
//   /// [isList] 请求的数据是否为List列表 默认对象
//   /// [isList]=true 请求data数据为[]list列表
//   void post<T>(String url,
//       {String? baseUrl,
//         Map<String, dynamic>? params,
//         required data,
//         Success<T>? success,
//         SuccessList<T>? successList,
//         Error? error,
//         bool isList = false}) {
//     if (isList) {
//       _requestList<T>(Method.post, url,
//           data: data,
//           baseUrl: baseUrl,
//           params: params,
//           success: successList,
//           error: error);
//     } else {
//       _request<T>(Method.post, url,
//           data: data,
//           baseUrl: baseUrl,
//           params: params,
//           success: success,
//           error: error);
//     }
//   }
// }
//
//
// //   mixin LoginModel {
// // // get请求
// //   loadCode(
// //       String value, {
// //         required Success<String> success,
// //         required Error error,
// //       }) {
// //     Http.instance.get(Api.loadxxx,
// //         params: {"key": value}, success: success, error: error);
// //   }
// // }