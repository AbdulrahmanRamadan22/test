import 'package:flutter/material.dart';

class Text_Form_Field extends StatelessWidget {
  const Text_Form_Field(
      {super.key, required this.hint, required this.controller});

  final String hint;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: (value) {
        if (value!.isEmpty) {
          return 'required';
        }
        return null;
      },
      decoration: InputDecoration(
        hintText: 'Enter Your $hint',
        contentPadding: const EdgeInsets.symmetric(vertical: 2, horizontal: 10),
        filled: true,
        fillColor: Colors.grey[200],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide:
              const BorderSide(color: Color.fromARGB(255, 238, 238, 238)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide:
              const BorderSide(color: Color.fromARGB(255, 238, 238, 238)),
        ),
      ),
    );
  }
}
