import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:seventyfivehard/models/challenge_model.dart';
import 'package:seventyfivehard/utility/shared_preferences/shared_preferences_helper.dart';

class DatabaseService {
  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('users');
  final CollectionReference challengeCollection =
      FirebaseFirestore.instance.collection('challenges');

  /// Set the user data to the [FirebaseFirestore] as a new entry
  Future<void> setUserData({
    required Map<String, dynamic> userData,
    required String docId,
  }) async {
    await userCollection.doc(docId).set(userData).onError(
          (error, stackTrace) => throw Exception(error),
        );
  }

  /// Updates an existing entry on [FirebaseFirestore] for a given [uid]
  Future<void> updateUserData({required Map<String, dynamic> data}) async {
    String uid = await SharedPreferenceHelper.getUserId();
    return await userCollection.doc(uid).update(data).onError(
          (error, stackTrace) => throw Exception(error),
        );
  }

  Future<List<ChallengeModel>> getChallengeList(String userId) async {
    QuerySnapshot querySnapshot = await challengeCollection
        .where('challengeCreatorId', isEqualTo: userId)
        .get()
        .onError(
      (error, stackTrace) {
        throw Exception(error);
      },
    );
    return querySnapshot.docs
        .map((docData) => ChallengeModel.fromSnapshot(docData))
        .toList();
  }

  // Future<SalonData> getSalonData(String salonId) async {
  //   QuerySnapshot querySnapshot =
  //       await salonCollection.where('id', isEqualTo: salonId).get().onError(
  //     (error, stackTrace) {
  //       throw Exception(error);
  //     },
  //   );
  //   return SalonData.fromDocumentSnapshot(querySnapshot.docs.first);
  // }

  // /// Add review
  // Future<void> addReview({required Review reviewData}) async {
  //   final DocumentReference reference = reviewsCollection.doc();
  //   reviewData.id = reference.id;
  //   await reference.set(reviewData.toJson()).onError(
  //         (error, stackTrace) => throw Exception(error),
  //       );
  // }
}
