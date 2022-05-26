import 'package:dio/dio.dart';

import '../API/DioManager.dart';
import '../Model/News.dart';

typedef NewsSuccess = Function(List<News> data);

class NewsViewModel {
  static void getNews(int page ,NewsSuccess success) async {
    var path = "/api/appClient/noAuth/publish/v1/getNoticeFromChannel";
    var params = {"channelCode": "21", "pageIndex": "$page"};

    DioManager.instance.request<News>(path, false, false, params, (dic) => null,
        (list) {
      success(list);
    }, (errorRes) => null);
  }
}
