import 'package:flutter/material.dart';

class Button {
  iconButton(bgColor, icon, boxShadow, size) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
          color: bgColor,
          boxShadow: boxShadow,
          borderRadius: BorderRadius.circular(7.0)),
      child: icon,
    );
  }
}
