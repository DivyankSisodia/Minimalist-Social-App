// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/foundation.dart' show immutable;
import 'package:social_media_app/core/constants/firebase_field_name.dart';

@immutable
class Post {
  final String postId;
  final String posterId;
  final String content;
  final String postType;
  final String fileUrl;
  final DateTime createdAt;
  final List<String> likes;

  const Post({
    required this.postId,
    required this.posterId,
    required this.content,
    required this.postType,
    required this.fileUrl,
    required this.createdAt,
    required this.likes,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      FirebaseFieldNames.postId: postId,
      FirebaseFieldNames.posterId: posterId,
      FirebaseFieldNames.content: content,
      FirebaseFieldNames.postType: postType,
      FirebaseFieldNames.fileUrl: fileUrl,
      FirebaseFieldNames.datePublished: createdAt.millisecondsSinceEpoch,
      FirebaseFieldNames.likes: likes,
    };
  }

  factory Post.fromMap(Map<String, dynamic> map) {
    return Post(
      postId: map['postId'] as String,
      posterId: map['posterId'] as String,
      content: map['content'] as String,
      postType: map['postType'] as String,
      fileUrl: map['fileUrl'] as String,
      createdAt: DateTime.fromMillisecondsSinceEpoch(map['createdAt'] as int),
      likes: List<String>.from((map['likes'] as List<String>)),
    );
  }
}
