import 'dart:math';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc_example/utils/theme_util.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Utils {
  static void showSnackBar(BuildContext context, String message) {
    SnackBar snackBar = SnackBar(
      content: Text(message),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  static Widget getCachedNetworkImage({
    required String imageUrl,
    double? height,
    double? width,
  }) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      placeholder: (context, url) => Container(
        width: height ?? 100.h,
        height: width ?? 100.w,
        color: MyAppTheme.randomColorList[Random().nextInt(5)],
      ),
      errorWidget: (context, url, error) => const Icon(Icons.error),
      width: height ?? 100.h,
      height: width ?? 100.w,
      fit: BoxFit.cover,
    );
  }
}
