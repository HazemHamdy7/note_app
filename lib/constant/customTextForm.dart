// ignore_for_file: file_names

import 'package:flutter/material.dart';

class CustomTextForm extends StatelessWidget {
  final String hint;
  final bool obsText;
  final IconData? icon;
  final Color? color;
  final String? Function(String?) valid;
  final TextEditingController myController;

  const CustomTextForm(
      {super.key,
      required this.hint,
      this.icon,
      this.color,
      required this.myController,
      required this.valid,
      required this.obsText});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      child: TextFormField(
        obscureText: obsText,
        autocorrect: true,
        validator: valid,
        decoration: InputDecoration(
          prefix: Icon(
            icon,
            //   color: color,
          ),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 18, horizontal: 2),
          hintText: hint,
          hintStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          border: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: 2),
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
        ),
      ),
    );
  }
}
