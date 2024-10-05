import 'package:get/get.dart';
import 'package:newsapp/pages/ArticlePage/articlePage.dart';
import 'package:newsapp/pages/HomePage/home_page.dart';
import 'package:newsapp/pages/profilePage/profilepage.dart';

class BottomNavigation extends GetxController {
  

  var pages = [
      HomePage(),
      Articlepage(),
      Profilepage()
    
  ];

  get index => null;
}
