import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class HomePageSubtitle extends StatelessWidget {
  final String name;

  const HomePageSubtitle({
    super.key,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: <InlineSpan>[
          TextSpan(
            text: 'Hello ',
            style: TextStyle(
              fontSize: 12.sp,
            ),
          ),
          TextSpan(
            text: name,
            style: TextStyle(
                fontSize: 12.sp,
                color: Colors.teal,
                fontStyle: FontStyle.italic),
          ),
          TextSpan(
            text:
                ', below are the current challenges that you have taken up along with your friend(s)',
            style: TextStyle(
              fontSize: 12.sp,
            ),
          ),
        ],
      ),
    );
  }
}
