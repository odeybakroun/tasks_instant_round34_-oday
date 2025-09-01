import 'package:flutter/foundation.dart';

import '../domain/entity/book_entity.dart';
import '../domain/usecase/get_all_books.dart';

class BookNotifier extends ChangeNotifier {
  final GetAllBooks getAllBooks;
  List<BookEntity> users = [];
  bool loading = false;

  BookNotifier(this.getAllBooks);

  Future<void> load() async {
    loading = true;
    notifyListeners();
    users = await getAllBooks();
    loading = false;
    notifyListeners();
  }
}
