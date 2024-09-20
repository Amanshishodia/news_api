import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newsapp/components/NavigationBar.dart';
import 'package:newsapp/components/news_time_loader.dart';
import 'package:newsapp/components/trending_loader.dart';
import 'package:newsapp/pages/HomePage/widgets/newsTile.dart';
import 'package:newsapp/pages/HomePage/widgets/trendingCard.dart';
import 'package:newsapp/pages/NewsDetails/NewsDetails.dart';
import '../../controller/NewsController.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final NewsController newsController = Get.put(NewsController());

  @override
  void initState() {
    super.initState();
    // Fetch news when the page loads
    newsController.getTrendingNews();
    newsController.getNewsForYou();
    newsController.getBussinessNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primaryContainer,
                        borderRadius: BorderRadius.circular(100)),
                    child: const Icon(Icons.dashboard),
                  ),
                  const Text(
                    "NEWS APP",
                    style: TextStyle(
                        fontSize: 25,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1.5),
                  ),
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primaryContainer,
                        borderRadius: BorderRadius.circular(100)),
                    child: const Icon(Icons.person),
                  )
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Hottest News",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  Text(
                    "See All",
                    style: Theme.of(context).textTheme.labelSmall,
                  )
                ],
              ),
              const SizedBox(height: 20),

              // Trending News Section with CircularProgressIndicator
              Obx(() {
                if (newsController.isTrendingLoading.value) {
                  return const Center(
                      child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        TrendingLoader(),
                        TrendingLoader(),
                        TrendingLoader(),
                        TrendingLoader(),
                      ],
                    ),
                  ));
                } else {
                  return SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: newsController.trendingNewsList.map((news) {
                        return TrendingCard(
                          author: news.author ?? "Unknown",
                          title: news.title ?? "No Title",
                          imageUrl: news.urlToImage ?? "",
                          tag: "Trending",
                          time: news.publishedAt ?? "Unknown Time",
                          onTap: () {
                            Get.to(() => NewsdetailsPage(
                                  imagePath: news.urlToImage ??
                                      "https://your_default_image_url.png",
                                  title: news.title ?? "No Title",
                                  userName: news.author ?? "Unknown Author",
                                  description:
                                      news.description ?? "No Description",
                                  time: news.publishedAt ?? "Unknown Time",
                                ));
                          },
                        );
                      }).toList(),
                    ),
                  );
                }
              }),

              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "News for You",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  Text(
                    "See All",
                    style: Theme.of(context).textTheme.labelSmall,
                  )
                ],
              ),
              const SizedBox(height: 20),

              // News for You Section with CircularProgressIndicator
              Obx(() {
                if (newsController.isNewsLoading.value) {
                  return const Center(
                      child: SingleChildScrollView(
                    child: Column(
                      children: [
                        NewsTimeLoader(),
                        NewsTimeLoader(),
                      ],
                    ),
                  ));
                } else {
                  return SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children: newsController.newsforyou5.map((news) {
                        return Newstile(
                          author: news.author ?? "Unknown",
                          imageUrl: news.urlToImage ?? "",
                          time: news.publishedAt ?? "Unknown Time",
                          title: news.title ?? "No Title",
                          onTap: () {
                            Get.to(NewsdetailsPage(
                                description:
                                    news.description ?? "No Description",
                                imagePath: news.urlToImage ?? "",
                                time: news.publishedAt ?? "Unknown Time",
                                title: news.title ?? "No Title",
                                userName: news.author ?? "No AUTOR"));
                          },
                        );
                      }).toList(),
                    ),
                  );
                }
              }),

              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Bussiness News",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  Text(
                    "See All",
                    style: Theme.of(context).textTheme.labelSmall,
                  )
                ],
              ),
              const SizedBox(height: 20),
              Obx(() {
                if (newsController.isBussinessLoading.value) {
                  return const Center(child: Column(children:[ NewsTimeLoader(), NewsTimeLoader(), NewsTimeLoader()]));
                } else {
                  return SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children: newsController.bussinessNews.map((news) {
                        return Newstile(
                          author: news.author ?? "Unknown",
                          imageUrl: news.urlToImage ?? "",
                          time: news.publishedAt ?? "Unknown Time",
                          title: news.title ?? "No Title",
                          onTap: () {
                            Get.to(NewsdetailsPage(
                                description:
                                    news.description ?? "No Description",
                                imagePath: news.urlToImage ?? "",
                                time: news.publishedAt ?? "Unknown Time",
                                title: news.title ?? "No Title",
                                userName: news.author ?? "No AUTOR"));
                          },
                        );
                      }).toList(),
                    ),
                  );
                }
              }),
            ],
          ),
        ),
      ),
      floatingActionButton: const MyBottomNavigation(),
    );
  }
}
