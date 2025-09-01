// lib/features/user/data/model/user_model.dart
import '../../domain/entity/book_entity.dart';

class BookModel extends BookEntity {
  const BookModel({required super.id, required super.name});

  factory BookModel.fromJson(Map<String, dynamic> json) {
    return BookModel(id: json['id'].toString(), name: json['name'] ?? '');
  }
}
