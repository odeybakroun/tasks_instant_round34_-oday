import '../../domain/entity/book_entity.dart';
import '../../domain/repository/book_repository.dart';
import '../sources/book_remote_data_source.dart';

class BookRepositoryImpl implements BookRepository {
  final BookRemoteDataSource remote;
  BookRepositoryImpl(this.remote);

  @override
  Future<List<BookEntity>> getBooks() => remote.fetchBooks();
}
