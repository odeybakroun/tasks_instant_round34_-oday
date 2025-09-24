

import 'package:r34_21/features/posts/domain/entities/post.dart';


class PostModel extends Post {
  PostModel(
      {required super.id,
      required super.title,
      required super.description,
      required super.createAt});

  factory PostModel.fromJson(Map<String, dynamic> json) {


      return PostModel(
        id: json['id'],
        title: json['title'],
        description: json['content'],
        createAt: json['createAt']);
  }

    Map<String, dynamic> json() {
    return {
      'id': id,
      'title': title,
      'content': description,
      'createAt': createAt,
    };
  }

    PostModel copywith({
    String? id,
    String? title,
    String? content,
    int? createAt,
  }) {
    return PostModel(
        id: id ?? this.id,
        title: title ?? this.title,
        description: description ,
        createAt: createAt ?? this.createAt);
  }
}