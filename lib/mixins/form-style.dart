import 'package:flutter/material.dart';

class FormStyle {
  textFieldStyle(String label) {
    Color errorColor = Colors.red[600];
    Color focusColor = Colors.green[200];
    final focusedBorder = OutlineInputBorder(
        borderSide: BorderSide(width: 1.0, color: focusColor));
    final focusedErrorBorder = OutlineInputBorder(
        borderSide: BorderSide(width: 1.0, color: errorColor));
    return InputDecoration(
        labelText: label,
        errorBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 1.0, color: errorColor)),
        focusedBorder: focusedBorder,
        focusedErrorBorder: focusedErrorBorder,
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 1.0, color: Colors.grey[350])));
  }
}
