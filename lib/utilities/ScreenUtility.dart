import 'package:flutter/material.dart';

class ScreenUtility{
  double height;
  double width;

  ScreenUtility({
    required this.height,
    required this.width,
  });

  static ScreenUtility getMediaQuerySizes(BuildContext context){
    return ScreenUtility(height: MediaQuery.of(context).size.height, width: MediaQuery.of(context).size.width);
  }

}