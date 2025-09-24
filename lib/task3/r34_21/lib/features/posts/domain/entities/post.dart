import 'package:equatable/equatable.dart';

class Post extends Equatable {
  final String id;
  final String title;
  final String description;
  final int createAt;

  const Post({
    required this.id,
    required this.title,
    required this.description,
    required this.createAt,
  });

  @override
  List<Object?> get props => [id, description, title,createAt];
}
