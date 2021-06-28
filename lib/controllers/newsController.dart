import 'package:get/state_manager.dart';
import 'package:newsapp/models/topNews.dart';
import 'package:newsapp/controllers/remoteServices.dart';

class NewsController extends GetxController {
  var articleList = TopHeadlines().obs;
  var isLoading = true.obs;
  var totalItems=0.obs;

  @override
  void onInit() {
    fetchData();

    super.onInit();
  }

  void fetchData() async {
    try {
      isLoading.value = true;

      var news = await RemoteServices.fetchNews();
      // print(news.totalResults);
      // print(news.articles[0].url);
      if (news != null) {
        articleList.value = news;
        totalItems.value = news.articles.length;
      }
    } catch (e) {} finally {
      isLoading.value = false;
    }
  }
}
