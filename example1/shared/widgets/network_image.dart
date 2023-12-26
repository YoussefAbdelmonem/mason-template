import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../core/utiles/extentions.dart';
import 'shimer_loading_items.dart';

class NetworkImagesWidgets extends StatelessWidget {
  NetworkImagesWidgets(this.url, {Key? key, this.fit, this.width, this.height})
      : super(key: key);
  String url;
  double? width;
  double? height;
  BoxFit? fit;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: url != ''
          ? CachedNetworkImage(
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                    child: LoadingImage(
                  w: width,
                  h: double.infinity,
                )
                    // CircularProgressIndicator(value: downloadProgress.progress)
                    ),
              ),
              fit: fit,
              imageUrl: url,
              errorWidget: (context, _, __) => Image.asset(
                "logo".png("icons"),
                fit: BoxFit.contain,
                // color: AppColors.primiry,
              ),
            )
          : Image.asset(
              "logo".png('images'),
              fit: BoxFit.contain,
              //color: AppColors.primiry,
            ),
    );
  }
}
