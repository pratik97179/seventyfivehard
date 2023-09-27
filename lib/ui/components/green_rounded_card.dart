import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class GreenRoundedCard extends StatelessWidget {
  final Widget child;
  const GreenRoundedCard({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(0.7.h),
      decoration: BoxDecoration(
        color: Color(0xFF186F65),
        borderRadius: BorderRadius.circular(1.h),
      ),
      child: child,
    );
  }
}
