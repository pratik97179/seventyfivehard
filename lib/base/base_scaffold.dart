import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class BaseScaffold extends StatelessWidget {
  final Widget body;
  final Widget? appBar;

  const BaseScaffold({
    super.key,
    this.appBar,
    required this.body,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 223, 223, 223),
      appBar: appBar != null
          ? AppBar(
              automaticallyImplyLeading: false,
              title: appBar,
              elevation: 0,
              backgroundColor: Color.fromARGB(255, 223, 223, 223),
            )
          : null,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.w),
        child: body,
      ),
    );
  }
}
