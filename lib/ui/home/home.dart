import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:seventyfivehard/base/base_scaffold.dart';
import 'package:seventyfivehard/models/challenge_model.dart';
import 'package:seventyfivehard/state/home_provider.dart';
import 'package:seventyfivehard/ui/components/app_title.dart';
import 'package:seventyfivehard/ui/components/challenge_card.dart';
import 'package:seventyfivehard/ui/components/home_page_subtitle.dart';
import 'package:sizer/sizer.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    context.read<HomeProvider>().initHomeScreen();
  }

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      body: Consumer<HomeProvider>(
        builder: (context, provider, child) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 7.h),
              GestureDetector(
                onTap: () => FirebaseAuth.instance.signOut(),
                child: AppTitle(),
              ),
              SizedBox(height: 2.h),
              HomePageSubtitle(
                name: provider.userDetails.name ?? 'Loading...',
              ),
              SizedBox(height: 3.h),
              provider.challenges.length == 0
                  ? Expanded(
                      child: Center(
                        child: Text(
                          'There are currently no active challenges yet!',
                          style: TextStyle(
                            fontSize: 15.sp,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    )
                  : Expanded(
                      child: ListView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        itemCount: provider.challenges.length,
                        itemBuilder: (context, index) {
                          ChallengeModel challenge = provider.challenges[index];
                          return ChallengeCard(
                            onTap: () {},
                            startedOn: challenge.challengeStartedOn!,
                            paraticipantsCount:
                                challenge.participantsId!.length,
                            challengeName: challenge.challengeName!,
                            challengeTermsCount:
                                challenge.challengeTerms!.length,
                          );
                        },
                      ),
                    ),
              SizedBox(height: 2.5.h),
            ],
          );
        },
      ),
    );
  }
}
