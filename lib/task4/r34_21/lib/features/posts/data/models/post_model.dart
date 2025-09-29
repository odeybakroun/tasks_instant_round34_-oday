import 'package:r34_21/features/posts/domain/entities/post.dart';

class PostModel extends Post {
  PostModel({
    required super.id,
    required super.title,
    required super.content,
    required super.views,
  });

  /// JSON → Model
  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      id: json['id'].toString(),
      title: json['title'] ?? '',
      content: json['content'] ?? '',
      views: json['views'] ?? 0,
    );
  }

  /// Entity → Model
  factory PostModel.fromEntity(Post post) {
    return PostModel(
      id: post.id,
      title: post.title,
      content: post.content,
      views: post.views,
    );
  }

  /// Model → Entity
  Post toEntity() {
    return Post(
      id: id,
      title: title,
      content: content,
      views: views,
    );
  }

  /// Model → JSON (update)
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'content': content,
      'views': views,
    };
  }

  /// Model → JSON (create)
  Map<String, dynamic> toJsonForCreate() {
    return {
      'title': title,
      'body': content,
      'userId': int.tryParse(id) ?? 1,
    };
  }

  PostModel copyWith({
    String? id,
    String? title,
    String? content,
    int? views,
  }) {
    return PostModel(
      id: id ?? this.id,
      title: title ?? this.title,
      content: content ?? this.content,
      views: views ?? this.views,
    );
  }
}