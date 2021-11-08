import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

const kusername = 'username';
const kprofileid = 'profileid';
const kprofilepicture = 'profilepicture';
const kemail = 'email';
const kprofileType = 'profiletype';

class UserModel {
  final String uid;
  final String profileUrl;
  final String email;
  final bool? hasPaid;

  UserModel(
      {required this.email,
      required this.uid,
      required this.profileUrl,
      required this.hasPaid});

  factory UserModel.fromFirebase(User user) {
    return UserModel(
      hasPaid: null,
      email: user.email!,
      uid: user.uid,
      profileUrl: user.photoURL ?? "",
    );
  }
  factory UserModel.fromSnapshot(DocumentSnapshot snapshot) {
    return UserModel(
        hasPaid: null,
        email: kemail,
        uid: kprofileid,
        profileUrl: kprofilepicture);
  }
}
