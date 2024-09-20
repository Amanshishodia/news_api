import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newsapp/controller/NewsController.dart';
import 'package:newsapp/pages/ArticlePage/widgets/searchWidget.dart';
import 'package:newsapp/pages/HomePage/widgets/newsTile.dart';
import 'package:newsapp/pages/NewsDetails/NewsDetails.dart';

class Articlepage extends StatelessWidget {
  const Articlepage({super.key});

  @override
  Widget build(BuildContext context) {
    NewsController newsController = Get.put(NewsController());

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              // Back button
              Searchwidget(),
              const SizedBox(height: 30), // Added spacing for better UI

              // News List Section
              Expanded(
                child: Obx(() {
                  if (newsController.allNewsList.isEmpty) {
                    return const Center(child: CircularProgressIndicator()); // Loading indicator
                  }

                  return ListView.builder(
                    itemCount: newsController.allNewsList.length,
                    itemBuilder: (context, index) {
                      final news = newsController.allNewsList[index];
                      return Newstile(
                        onTap: () {
                          Get.to(NewsdetailsPage(
                            description: news.description ?? "No Description",
                            imagePath: news.urlToImage ?? "",
                            time: news.publishedAt ?? "Unknown Time",
                            title: news.title ?? "No Title",
                            userName: news.author ?? "No Author",
                          ));
                        },
                        author: news.author ?? "Unknown",
                        imageUrl: news.urlToImage ?? "",
                        time: news.publishedAt ?? "Unknown Time",
                        title: news.title ?? "No Title",
                      );
                    },
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
