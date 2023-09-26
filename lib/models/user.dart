import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:math';

class UserModel {
  String? name;
  String? gmailId;
  String? appleId;

  UserModel({
    this.name,
    this.gmailId,
    this.appleId,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'gmailId': gmailId,
      'appleId': appleId,
    };
  }

  UserModel.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data() as Map<String, dynamic>);

  UserModel.fromMap(Map<String, dynamic> map) {
    name = map['name'];
    gmailId = map['gmailId'];
    appleId = map['appleId'];
  }
}

class HomeLocation {
  String? addressString;
  GeoPoint? geoLocation;

  HomeLocation({
    this.addressString,
    this.geoLocation,
  });

  Map<String, dynamic> toMap() {
    return {
      'addressString': addressString,
      'geoLocation': geoLocation,
    };
  }

  HomeLocation.fromFirestore(Map<String, dynamic> map) {
    GeoPoint? geoPoint = map['geoLocation'];

    addressString = map['addressString'];
    geoLocation = geoPoint != null
        ? GeoPoint(geoPoint.latitude, geoPoint.longitude)
        : null;
  }

  double calculateDistance(
    double startLat,
    double startLng,
    double endLat,
    double endLng,
  ) {
    const int radiusOfEarth = 6371;

    double latDifference = radians(endLat - startLat);
    double lngDifference = radians(endLng - startLng);

    double a = sin(latDifference / 2) * sin(latDifference / 2) +
        cos(radians(startLat)) *
            cos(radians(endLat)) *
            sin(lngDifference / 2) *
            sin(lngDifference / 2);

    double c = 2 * atan2(sqrt(a), sqrt(1 - a));

    double distance = radiusOfEarth * c;
    return distance;
  }

  double radians(double degrees) {
    return degrees * (pi / 180);
  }
}
