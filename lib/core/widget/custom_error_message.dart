import 'package:flutter/material.dart';

class CustomErrorMessageWidget extends StatelessWidget {
  const CustomErrorMessageWidget({super.key, required this.errorMessage});
  final String errorMessage;
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text(
          errorMessage,
          style: TextStyle(fontSize: 20),
        ));
  }
}
