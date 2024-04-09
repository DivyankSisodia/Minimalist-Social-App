import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:social_media_app/core/constants/firebase_collection_names.dart';
import 'package:social_media_app/core/constants/firebase_field_name.dart';
import '../model/post.dart';

final getAllPostsProvider = StreamProvider((ref) {

  // Iterable is used to loop through the data
  final controller = StreamController<Iterable<Post>>();

  final sub = FirebaseFirestore.instance
      .collection(FirebaseCollectionNames.posts)
      .orderBy(FirebaseFieldNames.createdAt, descending: true)
      .snapshots()
      .listen((snap) {
      // above line show that stream is listening to the data from the firestore
      final post = snap.docs.map(
        (postData) => Post.fromMap(
          postData.data(),
        ),
      );
      controller.sink.add(post);
    },
  );

  ref.onDispose(() {
    sub.cancel();
    controller.close();
  });

  return controller.stream;
});
