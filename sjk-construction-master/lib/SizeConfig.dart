// TODO Implement this library.
import 'package:flutter/material.dart';

class SizeConfig
{
  static double? height;
  static double? width;

  static void init(BuildContext context)
  {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    height = height / 100;
    width = width / 100;
  }
}