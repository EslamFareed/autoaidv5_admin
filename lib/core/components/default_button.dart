import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  DefaultButton(
      {super.key, required this.label, required this.onPressed, this.color});

  final String label;
  final void Function() onPressed;

  Color? color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: MaterialButton(
        onPressed: onPressed,
        color: color ?? Colors.deepOrange,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        textColor: Colors.white,
        child: Text(label),
      ),
    );
  }
}
