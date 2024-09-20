import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:newsapp/controller/NewsController.dart';

class NewsdetailsPage extends StatelessWidget {
  final String imagePath;
  final String title;
  final String userName;
  final String description;
  final String time;

  const NewsdetailsPage(
      {super.key,
      required this.description,
      required this.imagePath,
      required this.time,
      required this.title,
      required this.userName});

  @override
  Widget build(BuildContext context) {
    NewsController newsController = Get.put(NewsController());
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    InkWell(
                      onTap: Get.back,
                      child: Row(
                        children: [Icon(Icons.arrow_back_ios), Text('Back')],
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                    height: 330,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Expanded(
                        child: ClipRRect(
                      borderRadius: BorderRadius.circular(40),
                      child: Image.network(
                        imagePath,
                        fit: BoxFit.cover,
                      ),
                    ))),
                SizedBox(
                  height: 20,
                ),
                Text(
                  title,
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    Text(
                      time,
                      style: Theme.of(context).textTheme.labelSmall,
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    CircleAvatar(
                      radius: 15,
                      backgroundColor: Colors.red,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Flexible(
                      child: Text(
                        userName,
                        style: TextStyle(
                            fontSize: 18,
                            color:
                                Theme.of(context).colorScheme.secondaryContainer),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20,),
                Container(
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primaryContainer,
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    children: [
                      Obx(() => newsController.isSpeaking.value
                          ? IconButton(
                              onPressed: () {
                                newsController.stop();
                              },
                              icon: Icon(Icons.stop,size: 50,))
                          : IconButton(
                              onPressed: () {
                                newsController
                                    .speak(description ?? "No Description");
                              },
                              icon: Icon(
                                Icons.play_arrow_rounded,
                                size: 50,
                              ))),
                      Expanded(
                          child: Lottie.asset(
                        'Asset/Animation/wave.json',
                        height: 70,
                        animate: newsController.isSpeaking.value,
                      ))
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Flexible(
                      child: Text(
                        description,
                        style: TextStyle(
                            fontSize: 18,
                            color: Theme.of(context)
                                .colorScheme
                                .secondaryContainer),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
