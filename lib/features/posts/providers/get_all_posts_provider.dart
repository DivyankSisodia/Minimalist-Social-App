import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:social_media_app/features/posts/model/post.dart';

import '../../../core/constants/firebase_collection_names.dart';
import '../../../core/constants/firebase_field_name.dart';

final getAllPostsProvider = StreamProvider.autoDispose<Iterable<Post>>((ref) {
  final controller = StreamController<Iterable<Post>>();

  final sub = FirebaseFirestore.instance
      .collection(FirebaseCollectionNames.posts)
      .orderBy(FirebaseFieldNames.datePublished, descending: true)
      .snapshots()
      .listen((snapshot) {
    final posts = snapshot.docs.map(
      (postData) => Post.fromMap(
        postData.data(),
      ),
    );
    controller.sink.add(posts);
  });

  ref.onDispose(() {
    sub.cancel();
    controller.close();
  });

  return controller.stream;
});
