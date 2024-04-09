import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:social_media_app/core/constants/firebase_collection_names.dart';
import 'package:social_media_app/features/auth/model/user_model.dart';

final getUserInfoProvider = FutureProvider.autoDispose<UserModel>((ref) async {
  return FirebaseFirestore.instance
      .collection(FirebaseCollectionNames.users)
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .get()
      .then((value) {
    return UserModel.fromMap(value.data()!);
  });
});


// this provider will give us the information about current user