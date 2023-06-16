import 'package:flutter/material.dart';

class Categories {
  const Categories(
      {required this.id, required this.title, this.color = Colors.orange});

  final String id, title;
  final Color color;
}
