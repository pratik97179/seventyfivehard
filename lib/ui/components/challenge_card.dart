import 'package:flutter/material.dart';
import 'package:seventyfivehard/ui/components/challenge_date_widget.dart';
import 'package:seventyfivehard/ui/components/green_rounded_card.dart';
import 'package:seventyfivehard/ui/components/white_text_widget.dart';
import 'package:sizer/sizer.dart';

class ChallengeCard extends StatelessWidget {
  final Function() onTap;
  final DateTime startedOn;
  final int paraticipantsCount;
  final String challengeName;
  final int challengeTermsCount;

  const ChallengeCard({
    super.key,
    required this.startedOn,
    required this.paraticipantsCount,
    required this.challengeName,
    required this.challengeTermsCount,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(1.h),
        margin: EdgeInsets.symmetric(vertical: 1.h),
        decoration: BoxDecoration(
          color: Colors.brown.shade400,
          borderRadius: BorderRadius.circular(2.h),
        ),
        child: Row(
          children: <Widget>[
            ChallengeDate(startedOn: startedOn),
            SizedBox(width: 2.w),
            Expanded(
              child: Text(
                challengeName,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14.sp,
                ),
              ),
            ),
            SizedBox(width: 4.w),
            GreenRoundedCard(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  WhiteTextWidget(
                    text: 'Active',
                    fontSize: 10.sp,
                  ),
                  WhiteTextWidget(
                    text: 'members',
                    fontSize: 10.sp,
                  ),
                  WhiteTextWidget(text: paraticipantsCount.toString()),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
