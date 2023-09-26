import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:seventyfivehard/state/auth_provider.dart';
import 'package:seventyfivehard/ui/components/social_login_button.dart';
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
                  '75 Hard',
                  style: TextStyle(
                    fontSize: 35.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 3.h),
                SocialLoginButton(
                  buttonIcon: ImagePathConstant.googleIcon,
                  onTap: () => provider.googleLogIn(),
                ),
                    // SocialLoginButton(
                    //   buttonIcon: ImagePathConstant.appleIcon,
                    //   onTap: () => provider.appleLogin(),
                    // ),
              ],
            ),
          );
        },
      ),
    );
  }
}
