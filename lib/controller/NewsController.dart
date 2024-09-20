import 'dart:convert';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:newsapp/Model/NewsModel.dart';

class NewsController extends GetxController {
  RxList<NewsModel> trendingNewsList = <NewsModel>[].obs;
  RxList<NewsModel> allNewsList = <NewsModel>[].obs;
  RxList<NewsModel> newsforyou5 = <NewsModel>[].obs;
  RxList<NewsModel> bussinessNews = <NewsModel>[].obs;
  RxBool isNewsLoading = false.obs;
  RxBool isTrendingLoading = false.obs;
  RxBool isBussinessLoading = false.obs;
  FlutterTts flutterTts = FlutterTts();
  RxBool isSpeaking = false.obs;

  Future<void> getTrendingNews() async {
    isTrendingLoading.value = true;
    var baseUrl =
        "https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=7abb9a5be54c4705bf557492ca123cf7";

    try {
      var response = await http.get(Uri.parse(baseUrl));

      if (response.statusCode == 200) {
        var body = jsonDecode(response.body);
        var articles = body["articles"];

        for (var news in articles) {
          trendingNewsList.add(NewsModel.fromJson(news));
        }
      } else {
        print('Error: ${response.statusCode}');
      }
    } catch (e) {
      print('Exception: $e');
    }
    isTrendingLoading.value = false;
  }

  Future<void> getNewsForYou() async {
    isNewsLoading.value = true;
    var baseUrl =
        "https://newsapi.org/v2/everything?q=apple&from=2024-09-18&to=2024-09-18&sortBy=popularity&apiKey=7abb9a5be54c4705bf557492ca123cf7";

    try {
      var response = await http.get(Uri.parse(baseUrl));

      if (response.statusCode == 200) {
        var body = jsonDecode(response.body);
        var articles = body["articles"];

        for (var news in articles) {
          allNewsList.add(NewsModel.fromJson(news));
        }
        newsforyou5 = allNewsList.sublist(0, 5).obs;
      } else {
        print('Error: ${response.statusCode}');
      }
    } catch (e) {
      print('Exception: $e');
    }
    isNewsLoading.value = false;
  }

  Future<void> getBussinessNews() async {
    isBussinessLoading.value = true;

    var baseUrl =
        "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=7abb9a5be54c4705bf557492ca123cf7";
    try {
      var response = await http.get(Uri.parse(baseUrl));

      if (response.statusCode == 200) {
        var body = jsonDecode(response.body);
        var articles = body["articles"];

        for (var news in articles) {
          allNewsList.add(NewsModel.fromJson(news));
        }
      } else {
        print('Error: ${response.statusCode}');
      }
    } catch (e) {
      print('Exception: $e');
    }
    isBussinessLoading.value = false;
  }

  Future<void> searchNews(String search) async {
    isNewsLoading.value = true;

    var baseUrl =
        "https://newsapi.org/v2/everything?q=$search&apiKey=7abb9a5be54c4705bf557492ca123cf7";
    try {
      var response = await http.get(Uri.parse(baseUrl));

      if (response.statusCode == 200) {
        var body = jsonDecode(response.body);
        var articles = body["articles"];
        allNewsList.clear();

        for (var news in articles) {
          allNewsList.add(NewsModel.fromJson(news));
        }
      } else {
        print('Error: ${response.statusCode}');
      }
    } catch (e) {
      print('Exception: $e');
    }
    isNewsLoading.value = false;
  }

  Future<void> speak(String text) async {
    isSpeaking.value = true;
    await flutterTts.setLanguage("en-US");
    await flutterTts.setPitch(1);
    await flutterTts.setSpeechRate(0.5);
    await flutterTts.speak(text);
    isSpeaking.value = false;
  }

  void stop() async {
    await flutterTts.stop();
    isSpeaking.value = false;
  }
}
