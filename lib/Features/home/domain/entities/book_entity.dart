import 'package:hive_flutter/adapters.dart';
part 'book_entity.g.dart';

@HiveType(typeId: 0)
class BookEntity {
  @HiveField(0)
  String? image;
  @HiveField(1)
  String? author;
  @HiveField(2)
  String title;
  @HiveField(3)
  num? averageRating;
  @HiveField(4)
  num? ratingCount;

  BookEntity(
      {this.author,
      this.averageRating,
      this.image,
      this.ratingCount,
      required this.title});
}
