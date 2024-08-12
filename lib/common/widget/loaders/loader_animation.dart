import 'package:ecom/Utils/constants/image_strings.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';


/// A circular loader widget with customizable foreground and background colors.
class TLoaderAnimation extends StatelessWidget {
  const TLoaderAnimation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(child: Lottie.asset(TImages.defaultLoaderAnimation, height: 200, width: 200));
  }
}