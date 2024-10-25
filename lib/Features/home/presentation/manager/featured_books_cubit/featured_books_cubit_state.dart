part of 'featured_books_cubit_cubit.dart';

@immutable
sealed class FeaturedBooksCubitState {}

final class FeaturedBooksCubitInitial extends FeaturedBooksCubitState {}

final class FeaturedBooksCubitLoading extends FeaturedBooksCubitState {}

final class FeaturedBooksCubitSuccess extends FeaturedBooksCubitState {
  List<BookEntity> books;
  FeaturedBooksCubitSuccess(this.books);
}

final class FeaturedBooksCubitFailure extends FeaturedBooksCubitState {
  String errMessage;
  FeaturedBooksCubitFailure(this.errMessage);
}
