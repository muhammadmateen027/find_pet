import 'package:flutter/material.dart';

// Will use this shimmer effect as a loading architecture in detail page

extension AppBorder on Widget {
  Container primaryBorder() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(1.0),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      child:this,
    );
  }

  Container detailViewBorder() {
    return Container(
      width: double.maxFinite,
      margin: const EdgeInsets.only(top: 30),
      padding: const EdgeInsets.symmetric(
        horizontal: 18.0,
        vertical: 10,
      ),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(60),
          topRight: Radius.circular(60),
        ),
      ),
      child: this,
    );
  }
}