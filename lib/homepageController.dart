import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newsapp/components/NavigationBar.dart';
import 'package:newsapp/controller/bottomNavigation.dart';

class Homepagecontroller extends StatelessWidget {
  const Homepagecontroller({super.key});

  @override
  Widget build(BuildContext context) {
     BottomNavigation controller = Get.put(BottomNavigation());
    return Scaffold(
      floatingActionButton: MyBottomNavigation(),
      body: Obx(()=>controller.pages[controller.index.value]),
    );
  }
}
