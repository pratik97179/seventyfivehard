import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:seventyfivehard/utility/colors_constant.dart';
import 'package:sizer/sizer.dart';

class SocialLoginButton extends StatelessWidget {
  final String buttonIcon;
  final Function() onTap;

  const SocialLoginButton({
    super.key,
    required this.buttonIcon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 4.w,
          vertical: 1.5.h,
        ),
        decoration: BoxDecoration(
          border: Border.all(
            color: ColorsConstant.greyBorderColor,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: <Widget>[
            SvgPicture.asset(
              buttonIcon,
              height: 2.h,
            ),
            SizedBox(width: 5.w),
            Text(
              'Login with Google',
              style: TextStyle(
                fontSize: 11.5.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
