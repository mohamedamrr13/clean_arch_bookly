import 'package:clean_arch_bookly/Features/home/domain/entities/book_entity.dart';
import 'package:clean_arch_bookly/Features/home/data/models/book_model/book_model.dart';
import 'package:clean_arch_bookly/constants.dart';
import 'package:clean_arch_bookly/core/utils/api_service.dart';
import 'package:hive_flutter/hive_flutter.dart';

abstract class HomeRemoteDataSource {
  Future<List<BookEntity>> fetchFeaturedBooks();
  Future<List<BookEntity>> fetchNewestBooks();
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final ApiService apiService;

  HomeRemoteDataSourceImpl(this.apiService);
  @override
  Future<List<BookEntity>> fetchFeaturedBooks() async {
    var data = await apiService.get(
        endPoint: 'volumes?q=Marvel:Hollywood&Filtering=free-ebooks');
    List<BookEntity> booksList = getBooks(data);
    saveData(booksList, kFeaturedBooksBox);
    return booksList;
  }

  @override
  Future<List<BookEntity>> fetchNewestBooks() async {
    var data = await apiService.get(
        endPoint:
            'volumes?q=subject:Fiction&Sorting=relevance&Filtering=free-ebooks');
    List<BookEntity> books = getBooks(data);
    saveData(books, kNewestBooksBox);
    return books;
  }
}

void saveData(List<BookEntity> booksList, final String boxName) {
  var books = Hive.box(boxName);
  books.addAll(booksList);
}

List<BookEntity> getBooks(Map<String, dynamic> data) {
  List<BookEntity> books = [];

  for (var bookMap in data['item']) {
    books.add(BookModel.fromJson(bookMap));
  }
  return books;
}
