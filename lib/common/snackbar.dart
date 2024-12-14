import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void _showGreetSnackbar(BuildContext context) {
  final screenWidth = MediaQuery.of(context).size.width;

  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        'Hello! Welcome',
        style: TextStyle(color: Colors.white, fontSize: 16),
        textAlign: TextAlign.center,
      ),
      backgroundColor: Colors.green,
      behavior: SnackBarBehavior.floating,
      margin: EdgeInsets.symmetric(
        horizontal: screenWidth * 0.1,
      ).copyWith(
        top: 50.0,
        bottom: 0,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      duration: Duration(seconds: 3),
    ),
  );
}
