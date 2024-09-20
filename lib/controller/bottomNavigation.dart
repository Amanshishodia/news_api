import 'package:get/get.dart';
import 'package:newsapp/pages/ArticlePage/articlePage.dart';
import 'package:newsapp/pages/HomePage/home_page.dart';
import 'package:newsapp/pages/profilePage/profilepage.dart';

class BottomNavigation extends GetxController {
  RxInt index = 0.obs;

  var pages = [
      HomePage(),
      Articlepage(),
      Profilepage()
    
  ];
}
