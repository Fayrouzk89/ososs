import 'package:flutter/material.dart';

import 'colors.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CustomImage extends StatelessWidget {
  const CustomImage(
      {this.width = 100,
      required this.height,
      this.bgColor,
      this.borderWidth = 0,
      this.borderColor,
      this.trBackground = false,
      this.isNetwork = true,
      this.radius = 20,
      required this.url});

  final String url;
  final double width;
  final double height;
  final double borderWidth;
  final Color? borderColor;
  final Color? bgColor;
  final bool trBackground;
  final bool isNetwork;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: (url != "")
          ? CachedNetworkImage(
              imageUrl: url,
              imageBuilder: (context, imageProvider) => Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              placeholder: (context, url) => emptyImage(),
              errorWidget: (context, url, error) => emptyImage(),
            )
          : Container(
              width: width,
              height: height,
              child: emptyImage(),
            ),
    );
  }

  Widget emptyImage() {
    return Container(
        decoration: BoxDecoration(
          border:
              Border.all(color: borderColor ?? cardColor, width: borderWidth),
          color: Colors.black12,
          borderRadius: BorderRadius.circular(radius),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Image.asset("assets/pic.png"),
        ));
  }
}
