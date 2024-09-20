import 'package:flutter/material.dart';
import 'package:newsapp/components/loading_container.dart';

class NewsTimeLoader extends StatelessWidget {
  const NewsTimeLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.all(10),
      height: 150,
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primaryContainer,
          borderRadius: BorderRadius.circular(20)),
      child: Row(
        children: [
          LoadingContainer(height: 120, width: 120),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      LoadingContainer(height: 30, width: 30),
                      SizedBox(
                        width: 10,
                      ),
                      Flexible(
                        child: LoadingContainer(
                            height: 20,
                            width: MediaQuery.of(context).size.width / 3),
                      ),
                    ],
                  ),
                ),
                LoadingContainer(
                    height: 15, width: MediaQuery.of(context).size.width / 1.6),
                SizedBox(
                  height: 10,
                ),
                LoadingContainer(
                    height: 15, width: MediaQuery.of(context).size.width / 1.8),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    LoadingContainer(
                        height: 15,
                        width: MediaQuery.of(context).size.width / 5),
                    LoadingContainer(
                        height: 15,
                        width: MediaQuery.of(context).size.width / 5)
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
