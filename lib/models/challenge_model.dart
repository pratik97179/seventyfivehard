import 'package:cloud_firestore/cloud_firestore.dart';

class ChallengeModel {
  String? challengeCreatorId;
  String? challengeName;
  List<String>? participantsId;
  List<String>? challengeTerms;
  DateTime? challengeStartedOn;

  ChallengeModel.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data() as Map<String, dynamic>);

  ChallengeModel.fromMap(Map<String, dynamic> map) {
    challengeCreatorId = map['challengeCreatorId'];
    challengeName = map['challengeName'];
    participantsId = map['participantsId'] != null
        ? map['participantsId'].cast<String>()
        : [];
    challengeTerms = map['challengeTerms'] != null
        ? map['challengeTerms'].cast<String>()
        : [];
    challengeStartedOn = (map['challengeStartedOn'] as Timestamp).toDate();
  }

  Map<String, dynamic> toMap() {
    return {
      'challengeCreatorId': challengeCreatorId,
      'challengeStartedOn':
          Timestamp.fromDate(challengeStartedOn ?? DateTime.now()),
      'participantsId': participantsId,
    };
  }
}
