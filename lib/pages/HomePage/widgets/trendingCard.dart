import 'package:flutter/material.dart';

class TrendingCard extends StatelessWidget {
  final String imageUrl;
  final String tag;
  final String time;
  final String title;
  final String author;
  final VoidCallback onTap;
  const TrendingCard(
      {super.key,
      required this.author,
      required this.imageUrl,
      required this.title,
      required this.tag,
      required this.time,required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(right: 10),
        padding: EdgeInsets.all(5),
        height: 320,
        width: 280,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Theme.of(context).colorScheme.primaryContainer,
        ),
        child: Column(
          children: [
            Expanded(
              child: Container(
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Theme.of(context).colorScheme.background,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "$tag",
                  style: Theme.of(context).textTheme.labelSmall,
                ),
                Text(
                  "$time",
                  style: Theme.of(context).textTheme.labelSmall,
                )
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Text(
                    "$title",
                    maxLines: 2,
                   
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 7,
            ),
            Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                CircleAvatar(
                  radius: 15,
                  backgroundColor: Theme.of(context).colorScheme.primary,
                ),
                SizedBox(
                  width: 10,
                ),
                Flexible(child: Text("$author"))
              ],
            ),
            SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }
}
