import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImageFromNetwork extends StatelessWidget {
  final String imageUrl;
  ImageFromNetwork(this.imageUrl);
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      placeholder: (context, url) => CircularProgressIndicator(),
      errorWidget: (context, url, error) => Icon(
        Icons.error_outline,
        color: Colors.black,
      ),
    );
  }
}
