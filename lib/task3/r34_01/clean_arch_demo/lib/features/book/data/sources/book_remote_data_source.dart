import '../model/book_model.dart';

abstract class BookRemoteDataSource {
  Future<List<BookModel>> fetchBooks();
}
