import 'package:flutter/material.dart';

class InputDecortions {
  static InputDecoration authInputDecoration({
    required String hinText,
    required String labelText,
    IconData? prefixIcon,
  }) {
    return InputDecoration(
        enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
          color: Color.fromARGB(255, 103, 193, 222),
        )),
        focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
          color: Color.fromARGB(255, 82, 118, 196),
          width: 3,
        )),
        hintText: hinText,
        labelText: labelText,
        labelStyle: const TextStyle(color: Colors.grey),
        prefixIcon: prefixIcon != null
            ? Icon(
                prefixIcon,
                color: Color.fromARGB(255, 101, 161, 192),
              )
            : null);
  }
}
