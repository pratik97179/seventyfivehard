import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:seventyfivehard/ui/components/green_rounded_card.dart';
import 'package:seventyfivehard/ui/components/white_text_widget.dart';

class ChallengeDate extends StatelessWidget {
  final DateTime startedOn;
  final bool getDate;
  final bool getMonth;
  final bool getYear;

  const ChallengeDate({
    super.key,
    required this.startedOn,
    this.getDate = false,
    this.getMonth = false,
    this.getYear = false,
  });

  @override
  Widget build(BuildContext context) {
    return GreenRoundedCard(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          WhiteTextWidget(
            text: getDateMonthYear(date: startedOn, dateTimeIndex: 0),
          ),
          WhiteTextWidget(
            text: getDateMonthYear(date: startedOn, dateTimeIndex: 1),
          ),
          WhiteTextWidget(
            text: getDateMonthYear(date: startedOn, dateTimeIndex: 2),
          ),
        ],
      ),
    );
  }
}

String getDateMonthYear({
  required DateTime date,
  required int dateTimeIndex,
}) {
  switch (dateTimeIndex) {
    case 0:
      return date.day.toString();
    case 1:
      return DateFormat("MMM").format(date);
    case 2:
      return date.year.toString();
  }

  return '';
}
