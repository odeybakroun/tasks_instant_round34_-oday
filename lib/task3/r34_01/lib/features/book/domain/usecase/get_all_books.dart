import '../entity/book_entity.dart';
import '../repository/book_repository.dart';

class GetAllBooks {
  final BookRepository repo;
  GetAllBooks(this.repo);

  Future<List<BookEntity>> call() async {
    return await repo.getBooks();
  }
}
