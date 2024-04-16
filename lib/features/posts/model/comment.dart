import 'package:flutter/foundation.dart' show immutable;
import 'package:social_media_app/core/constants/firebase_field_name.dart';

@immutable
class Comment {
  final String commentId;
  final String postId;
  final String authorId;
  final String content;
  final DateTime createdAt;
  final List<String> likes;

  const Comment({
    required this.commentId,
    required this.postId,
    required this.authorId,
    required this.content,
    required this.createdAt,
    required this.likes,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      FirebaseFieldNames.commentId: commentId,
      FirebaseFieldNames.postId: postId,
      FirebaseFieldNames.authorId: authorId,
      FirebaseFieldNames.content: content,
      FirebaseFieldNames.createdAt: createdAt,
      FirebaseFieldNames.likes: likes,
    };
  }

  factory Comment.fromMap(Map<String, dynamic> map) {
    return Comment(
      commentId: map[FirebaseFieldNames.commentId] ?? '',
      postId: map[FirebaseFieldNames.postId] ?? '',
      authorId: map[FirebaseFieldNames.authorId] ?? '',
      content: map[FirebaseFieldNames.content] ?? '',
      createdAt: DateTime.fromMillisecondsSinceEpoch(
          map[FirebaseFieldNames.createdAt] ?? 0
      ),
      likes: List<String>.from(map[FirebaseFieldNames.likes] ?? []),
    );
  }
}
