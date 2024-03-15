import 'dart:ui';

import 'package:flutter/material.dart';

import 'style.dart';

void showAlertDialog(
    context, String message, String button, Function()? function) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
          child: AlertDialog(
            shadowColor: Colors.black,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0),
                side: BorderSide(color: Colors.grey.withOpacity(0.2))),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  message,
                  style: const TextStyle(
                    color: Color(0xFF00246B),
                  ),
                ),
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(
                    Icons.cancel,
                    size: 32,
                  ),
                  color: Colors.grey.withOpacity(0.7),
                )
              ],
            ),
            contentPadding: const EdgeInsets.symmetric(vertical: 18.0),
            content: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ElevatedButton(
                      onPressed: function,
                      style: ElevatedButton.styleFrom(
                          backgroundColor: AppTheme.blue),
                      child: Text(
                        button,
                        style: const TextStyle(color: Colors.white),
                      ))
                ],
              ),
            ),
          ),
        );
      });
}


showLoading(context) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        content: Container(
          height: 50,
          child: const Center(
            child: CircularProgressIndicator(
              color:  AppTheme.blue,
            ),
          ),
        ),
      );
    }
  );
}