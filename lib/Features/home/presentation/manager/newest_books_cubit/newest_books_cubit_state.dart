part of 'newest_books_cubit_cubit.dart';

import '../../../domain/entities/book_entity.dart';

sealed class NewestBooksCubitState {}

final class NewestBooksCubitInitial extends NewestBooksCubitState {}

final class NewestBooksCubitLoading extends NewestBooksCubitState {}

final class NewestBooksCubitSuccess extends NewestBooksCubitState {
  final List<BookEntity> books;
  NewestBooksCubitSuccess(this.books);
}

final class NewestBooksCubitFailure extends NewestBooksCubitState {
  final String errMessage;
  NewestBooksCubitFailure(this.errMessage);
}
