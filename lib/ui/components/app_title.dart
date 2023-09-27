import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class AppTitle extends StatelessWidget {
  const AppTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      '75 Hard',
      style: TextStyle(
        fontSize: 35.sp,
        fontWeight: FontWeight.w700,
      ),
    );
  }
}
