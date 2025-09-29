import 'package:r34_21/features/users/domain/entities/user.dart';

class UsersModel extends User {
  UsersModel({
    required super.id,
    required super.name,
    required super.email,
    required super.password,
  });

  factory UsersModel.fromJson(Map<String, dynamic> json) {
    return UsersModel(
      id: json['id']?.toString() ?? '',
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      password: json['password'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'password': password,
    };
  }

  Map<String, dynamic> toJsonForCreate() {
    return {
      'name': name,
      'email': email,
      'password': password,
    };
  }

  UsersModel copyWith({
    String? id,
    String? name,
    String? email,
    String? password,
  }) {
    return UsersModel(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }
}