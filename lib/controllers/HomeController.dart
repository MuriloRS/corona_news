import 'package:dio/dio.dart';

class HomeController {
  static const _baseUrl =
      'http://newsapi.org/v2/everything?q=corona-virus&language=pt&apiKey=5f4342d1cb8e469e8db0df96ec2836ce';

  static Future<Response> getNews() async {
    try {
      Response response = await Dio().get(_baseUrl);
      return response;
    } catch (e) {
      print(e);
    }
  }
}
