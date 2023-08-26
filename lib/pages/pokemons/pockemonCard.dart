import 'package:flutter/material.dart';

import '../../models/api_result.dart';
import 'package:get/get.dart';

import '../../utils/CustomImage.dart';
import '../../utils/widgets.dart';
class pockemonCard extends StatelessWidget {
  final Results results;
  const pockemonCard({Key? key, required this.results}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Card(
        // Define the shape of the card
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        // Define how the card's content should be clipped
        clipBehavior: Clip.antiAliasWithSaveLayer,
        elevation: 5,
        // Define the child widget of the card
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Add padding around the row widget
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                // Add an image widget to display an image
                CustomImage(
                  width: Get.width/3,
                  height: 120,
                  radius: 10, url:   results.url??"",
                ),
                // Add some spacing between the image and the text
                Container(width: 20),
                // Add an expanded widget to take up the remaining horizontal space
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      // Add some spacing between the top of the card and the title
                      Container(height: 5),
                      // Add a title widget
                      text(
                          results.name!,
                          textColor: Colors.black87
                      ),


                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
