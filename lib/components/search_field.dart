import 'dart:developer';

import 'package:flutter/material.dart';

class searchField extends StatelessWidget {
  void Function(String) searchFun;

  searchField({super.key, required this.searchFun});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 10,
            spreadRadius: 2,
            offset: Offset(0, 8),
          ),
        ],
        color: Color.fromARGB(255, 254, 249, 249),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Center(
        child: TextField(
          onSubmitted: (value) {
            log(value);
            searchFun(value);
          },
          decoration: InputDecoration(
            hint: Text(
              'Search for a city ..',
              style: TextStyle(color: Colors.grey),
            ),
            contentPadding: EdgeInsets.all(16),
            border: InputBorder.none,
            suffixIcon: Icon(Icons.search),
            suffixIconColor: Color(0xffA9C8F5),
          ),
        ),
      ),
    );
  }
}
