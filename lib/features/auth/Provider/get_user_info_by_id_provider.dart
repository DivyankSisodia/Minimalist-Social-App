import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:social_media_app/core/constants/firebase_collection_names.dart';
import 'package:social_media_app/features/auth/model/user_model.dart';

final getUserInfoByIdProvider =
    FutureProvider.autoDispose.family<UserModel, String>((ref, userId) async {
  return FirebaseFirestore.instance
      .collection(FirebaseCollectionNames.users)
      .doc(userId)
      .get()
      .then((value) {
    return UserModel.fromMap(value.data()!);
  });
});

// this provider will give us the information about a particular user
