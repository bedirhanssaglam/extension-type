import 'package:flutter/foundation.dart' show immutable;

@immutable
final class Post {
  final int? userId;
  final int? id;
  final String? title;
  final String? body;

  const Post({
    this.userId,
    this.id,
    this.title,
    this.body,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      userId: json['userId'] as int?,
      id: json['id'] as int?,
      title: json['title'] as String?,
      body: json['body'] as String?,
    );
  }

  @override
  String toString() =>
      "Response(userId: $userId,id: $id,title: $title,body: $body)";

  @override
  int get hashCode => Object.hash(userId, id, title, body);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Post &&
          runtimeType == other.runtimeType &&
          userId == other.userId &&
          id == other.id &&
          title == other.title &&
          body == other.body;
}
