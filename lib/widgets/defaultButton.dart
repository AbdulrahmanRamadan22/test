import 'package:flutter/material.dart';

Widget defaultButton({
  double width = double.infinity,
  double height = 40,
  Color? color = Colors.grey,
  required String? text,
  double radius = 0.0,
  bool isUppercase = true,
  required Function() onPressed,
}) =>
    Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(radius),
      ),
      width: width,
      height: height,
      child: MaterialButton(
        onPressed: onPressed,
        child: Text(
          isUppercase ? text!.toUpperCase() : text!,
          style: const TextStyle(color: Colors.black, fontSize: 20),
        ),
      ),
    );
