import 'package:flutter/material.dart';

class background extends StatelessWidget {
  String imageUrl;
  background({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(child: Image.asset(imageUrl, fit: BoxFit.cover));
  }
}
