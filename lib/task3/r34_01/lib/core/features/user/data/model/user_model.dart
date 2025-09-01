// lib/features/user/data/model/user_model.dart
import '../../domain/entity/user_entity.dart';

class UserModel extends UserEntity {
  const UserModel({required super.id, required super.name});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(id: json['id'].toString(), name: json['name'] ?? '');
  }
}





