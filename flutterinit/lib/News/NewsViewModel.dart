import '../API/DioManager.dart';
import '../Model/News.dart';

typedef NewsSuccess = Function(List<News> data);

class NewsViewModel {

  static void getNews(NewsSuccess success) async {
    var path = "/api/appClient/noAuth/publish/v1/getNoticeFromChannel";
    var param = {"channelCode":"21","pageIndex":"1"};

    DioManager.instance.request<News>(path, true, param, (data) {

      success(data as List<News>);

    }, (errorRes) {

    });
  }

}