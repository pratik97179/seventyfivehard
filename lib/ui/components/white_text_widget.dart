import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class WhiteTextWidget extends StatelessWidget {
  final String text;
  final double? fontSize;

  const WhiteTextWidget({
    super.key,
    required this.text,
    this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: Colors.white,
        fontSize: fontSize ?? 12.sp,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
