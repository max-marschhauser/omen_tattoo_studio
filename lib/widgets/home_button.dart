import 'package:flutter/material.dart';

class OMHomeButton extends StatelessWidget {
  final String title;
  final Function function;

  const OMHomeButton({
    required this.title,
    required this.function,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {
          function();
        },
        child: Text(title));
  }
}
