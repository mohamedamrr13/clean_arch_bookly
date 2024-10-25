import 'package:clean_arch_bookly/Features/home/domain/entities/book_entity.dart';
import 'package:clean_arch_bookly/constants.dart';
import 'package:hive_flutter/hive_flutter.dart';

abstract class HomeLocalDataSource {
  List<BookEntity> fetchFeatuedBooks();
  List<BookEntity> fetchNewestBooks();
}

class HomeLocalDataSourceImpl {
  List<BookEntity> fetchFeatuedBooks() {
    var books = Hive.box<BookEntity>(kFeaturedBooksBox).values.toList();
    return books;
  }

  List<BookEntity> fetchNewestBooks() {
    var books = Hive.box<BookEntity>(kNewestBooksBox).values.toList();
    return books;
  }
}
