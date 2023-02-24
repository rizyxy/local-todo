import 'package:flutter/material.dart';

class ColorMap {
  static Map<String, Color> light = {
    'primary': Colors.white,
    'secondary': const Color.fromARGB(255, 32, 44, 255),
    'text-primary': Colors.black,
    'text-secondary': Colors.black
  };

  static Map<String, Color> dark = {
    'primary': Colors.black,
    'secondary': const Color.fromARGB(255, 32, 44, 255),
    'text-primary': Colors.white,
    'text-secondary': Colors.black
  };
}
