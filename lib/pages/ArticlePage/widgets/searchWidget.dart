import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newsapp/controller/NewsController.dart';

class Searchwidget extends StatelessWidget {
  const Searchwidget({super.key});

  @override
  Widget build(BuildContext context) {
    NewsController controller = Get.put(NewsController());
    TextEditingController searchController = TextEditingController();
    return Container(
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Theme.of(context).colorScheme.primaryContainer,
      ),
      child: Row(
        children: [
          Expanded(
              child: TextField(
              controller: searchController,
            decoration: InputDecoration(
              hintText: "Search News...",
//prefixIcon: Icon(Icons.search),
              fillColor: Theme.of(context).colorScheme.primaryContainer,
              border: InputBorder.none,
            ),
            ),
          ),
          Obx(
            () => controller.isNewsLoading.value
                ? Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Theme.of(context).colorScheme.primary),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: CircularProgressIndicator(color: Colors.white,),
                    ),
                  )
                : InkWell(
                    onTap: () {
                      controller.searchNews(searchController.text);
                    },
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Theme.of(context).colorScheme.primary),
                      child: Icon(Icons.search),
                    ),
                  ),
          )
        ],
      ),
    );
  }
}
