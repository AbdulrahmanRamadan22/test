import 'package:flutter/material.dart';

Widget defaultFormField(
        {required TextEditingController? controller,
        required TextInputType? type,
        required String? hint,
        IconData? suffixIcon,
        Function()? suffixPressed,
        Function(String)? onFieldSubmitted,
        required String? Function(String?) validator,
        bool isPassword = false}) =>
    TextFormField(
      keyboardType: type,
      controller: controller,
      validator: validator,
      obscureText: isPassword,
      onFieldSubmitted: onFieldSubmitted,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        hintText: hint,
        suffixIcon: IconButton(
          icon: Icon(
            suffixIcon,
          ),
          onPressed: suffixPressed,
        ),
      ),
    );
