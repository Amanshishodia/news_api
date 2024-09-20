import 'dart:typed_data';

import 'package:flutter/material.dart';

class Newstile extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String time;
  final String author;
  final VoidCallback onTap;

  const Newstile(
      {super.key,
      required this.onTap,
      required this.author,
      required this.imageUrl,
      required this.time,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: 10),
        padding: EdgeInsets.all(10),
        height: 150,
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primaryContainer,
            borderRadius: BorderRadius.circular(20)),
        child: Row(
          children: [
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.background,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: Colors.black, // Set the color of the border
                  width: 2, // Set the width of the border
                ),
              ),
              clipBehavior: Clip
                  .antiAlias, // Ensure the child is clipped to the border radius
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
              ),
            ),
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
                        CircleAvatar(
                          radius: 10,
                          backgroundColor: Theme.of(context).colorScheme.primary,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Flexible(
                          child: Text("$author"),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    "$title",
                    maxLines: 2,
                  ),
                  Text(
                    "$time",
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
