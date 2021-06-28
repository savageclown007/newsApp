import 'package:http/http.dart' as http;
import 'package:newsapp/models/topNews.dart';

class RemoteServices {
  static var client = new http.Client();

  // ignore: missing_return
  static Future<TopHeadlines> fetchNews() async {
    // ignore: close_sinks
    var url = Uri.parse(
        'https://newsapi.org/v2/top-headlines?country=in&apiKey=cae1c9971eb54051b16129b274dfe7fe');
    var response = await client.get(url);

    if (response.statusCode == 200) {
      var jsonString = response.body;
      // print(jsonString);
      var topHeadLines = topHeadlinesFromJson(jsonString);
      // print(topHeadLines.totalResults);
      return topHeadLines;
    } else {
      //show error
    }
  }
}
