import '../model/book_model.dart';
import 'book_remote_data_source.dart';

class BookRemoteDataSourceImpl implements BookRemoteDataSource {
  @override
  Future<List<BookModel>> fetchBooks() async {
    // Mock data
    return [
      const BookModel(id: "1", name: "Arwa"),
      const BookModel(id: "2", name: "Radwan"),
    ];
  }
}
