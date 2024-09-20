import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newsapp/controller/bottomNavigation.dart';

class MyBottomNavigation extends StatelessWidget {
  const MyBottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    BottomNavigation controller = Get.put(BottomNavigation());
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            height: 70,
            width: 200,
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.background,
                borderRadius: BorderRadius.circular(100)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                    onTap: () {
                      controller.index.value = 0;
                    },
                    child: Obx(
                      () => AnimatedContainer(
                         duration: Duration(milliseconds: 300),
                    curve: Curves.bounceInOut,
                          height: 40,
                          width: 40,
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: controller.index.value == 0
                                  ? Theme.of(context).colorScheme.primary
                                  : null,
                              borderRadius: BorderRadius.circular(100)),
                          child: Icon(
                            Icons.home,
                            color: controller.index.value == 0
                                ? Theme.of(context).colorScheme.background
                                : Theme.of(context)
                                    .colorScheme
                                    .secondaryContainer,
                            size: 25,
                          )),
                    )),
                InkWell(
                  onTap: () {
                    controller.index.value = 1;
                  },
                  child: Obx(()=>AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.bounceInOut,
                      height: 40,
                      width: 40,
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          color:controller.index.value == 1
                                  ? Theme.of(context).colorScheme.primary
                                  : null,
                          borderRadius: BorderRadius.circular(100)),
                      child: Icon(
                        Icons.book,
                        color: controller.index.value == 1
                                ? Theme.of(context).colorScheme.background
                                : Theme.of(context)
                                    .colorScheme
                                    .secondaryContainer,
                        size: 25,
                      )),)
                ),
               
              ],
            ),
          ),
        ],
      ),
    );
  }
}
