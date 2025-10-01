import 'package:r34_27/features/posts/domain/entities/post.dart';

class PostModel extends Post {
  PostModel({
    required super.id,
    required super.title,
    required super.text,
    required super.numOfLikes,
  });

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      id: json['id'],
      text: json['text'],
      numOfLikes: json['numOfLikes'],
      title: json['title'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 
    'text': text, 
    'numOfLikes': numOfLikes, 
    'title': title
    };
  }

  PostModel copyWith({
    String? id,
    String? title,
    String? text,
    int? numOfLikes,
  }) {
    return PostModel(
      id: id ?? this.id,
      title: title ?? this.title,
      text: text ?? this.text ,
      numOfLikes: numOfLikes ??  this.numOfLikes,
    );
  }
}
