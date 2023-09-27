import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:seventyfivehard/base/base_scaffold.dart';
import 'package:seventyfivehard/state/auth_provider.dart';
import 'package:seventyfivehard/ui/components/app_title.dart';
import 'package:seventyfivehard/ui/components/social_login_button.dart';
import 'package:seventyfivehard/utility/image_path_constant.dart';
import 'package:sizer/sizer.dart';

class Authentication extends StatelessWidget {
  const Authentication({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      body: Consumer<AuthProvider>(
        builder: (context, provider, child) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              AppTitle(),
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
          );
        },
      ),
    );
  }
}
