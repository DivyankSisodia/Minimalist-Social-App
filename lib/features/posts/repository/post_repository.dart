import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart' show immutable;
import 'package:social_media_app/core/constants/firebase_collection_names.dart';
import 'package:social_media_app/core/constants/firebase_field_name.dart';
import 'package:uuid/uuid.dart';

import '../model/post.dart';

@immutable
class PostRepository {
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;
  final _storage = FirebaseStorage.instance;

  // make posts
  Future<String?> makePost(
      {required String content,
      required File file,
      required String postType}) async {
    try {
      final postId = const Uuid().v1();

      // who is creating a post
      final posterId = _auth.currentUser!.uid;
      final now = DateTime.now();

      // Post file to storage
      final fileUid = const Uuid().v1();
      final path = _storage.ref(postType).child(fileUid);
      final taskSnapshot = await path.putFile(file);

      // Get download URL
      final downloadUrl = await taskSnapshot.ref.getDownloadURL();

      // create our post
      Post post = Post(
        postId: postId,
        posterId: posterId,
        content: content,
        postType: postType,
        fileUrl: downloadUrl,
        createdAt: now,
        likes: [],
      );

      // save post to firestore
      _firestore
          .collection(FirebaseCollectionNames.posts)
          .doc(postId)
          .set(post.toMap());

      return null;
    } catch (e) {
      return e.toString();
    }
  }

  // Like a post
  Future<String?> likeDislikePost(
      {required String postId, required List<String> likes}) async {
    try {

      // getting the current user
      final authorId = _auth.currentUser!.uid;

      if (likes.contains(authorId)) {
        // if we have already liked the post, unlike it
        _firestore
            .collection(FirebaseCollectionNames.posts)
            .doc(postId)
            .update({
              FirebaseFieldNames.likes: FieldValue.arrayRemove([authorId])
            });
      }
      else{
        // if we have not liked the post, like it
        _firestore
            .collection(FirebaseCollectionNames.posts)
            .doc(postId)
            .update({
              FirebaseFieldNames.likes: FieldValue.arrayUnion([authorId])
            });
      }

      return null;
    } catch (e) {
      return e.toString();
    }
  }
}
