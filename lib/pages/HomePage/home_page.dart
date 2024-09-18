import 'package:flutter/material.dart';
import 'package:newsapp/components/NavigationBar.dart';
import 'package:newsapp/pages/HomePage/widgets/newsTile.dart';
import 'package:newsapp/pages/HomePage/widgets/trendingCard.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'NewSeekers',
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: [
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
              SizedBox(
                height: 20,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    TrendingCard(
                      author: "Rahul Gupta",
                      title: "Life is Good",
                      imageUrl:
                          "https://imgs.search.brave.com/_6ytUuJxIexxyqjaYp5r_njIsXSNi5TnMOJN2I1Y7jw/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly93d3cu/ZGVzaWduaWZ5LmNv/bS9zdGFydC9hdXRv/bW90aXZlL29yaWdp/bmFsLnBuZw",
                      tag: "Trending no 1",
                      time: "2 Days Ago",
                    ),
                    TrendingCard(
                      author: "Rahul Gupta",
                      title: "Life is Good",
                      imageUrl:
                          "https://imgs.search.brave.com/_6ytUuJxIexxyqjaYp5r_njIsXSNi5TnMOJN2I1Y7jw/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly93d3cu/ZGVzaWduaWZ5LmNv/bS9zdGFydC9hdXRv/bW90aXZlL29yaWdp/bmFsLnBuZw",
                      tag: "Trending no 1",
                      time: "2 Days Ago",
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
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
              SizedBox(
                height: 20,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    Newstile(
                        author: "XYZ",
                        imageUrl: "",
                        time: "3 days Ago ",
                        title: "Hello gies"),
                    Newstile(
                        author: "XYZ",
                        imageUrl: "",
                        time: "3 days Ago ",
                        title: "Hello gies"),
                    Newstile(
                        author: "XYZ",
                        imageUrl: "",
                        time: "3 days Ago ",
                        title: "Hello gies"),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: MyBottomNavigation()
    );
  }
}
