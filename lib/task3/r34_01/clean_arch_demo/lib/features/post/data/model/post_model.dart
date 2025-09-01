// lib/features/user/data/model/user_model.dart
import '../../domain/entity/post_entity.dart';

class PostModel extends PostEntity {
  const PostModel({required super.id, required super.name});

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(id: json['id'].toString(), name: json['name'] ?? '');
  }
}
