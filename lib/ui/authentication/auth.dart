import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:seventyfivehard/state/auth_provider.dart';
import 'package:seventyfivehard/utility/colors_constant.dart';
import 'package:seventyfivehard/utility/image_path_constant.dart';
import 'package:sizer/sizer.dart';

class Authentication extends StatelessWidget {
  const Authentication({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 223, 223, 223),
      body: Consumer<AuthProvider>(
        builder: (context, provider, child) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  '75Hard',
                  style: TextStyle(
                    fontSize: 35.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 3.h),
                GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () => provider.googleLogIn(context),
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.5.h),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: ColorsConstant.greyBorderColor,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: <Widget>[
                        SvgPicture.asset(
                          ImagePathConstant.googleIcon,
                        ),
                        SizedBox(width: 10.w),
                        Text(
                          'Sign in with Google',
                          style: TextStyle(
                            fontSize: 11.5.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
