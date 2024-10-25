import 'package:clean_arch_bookly/Features/home/domain/entities/book_entity.dart';
import 'package:clean_arch_bookly/Features/home/domain/use_cases/featured_books_use_case.dart';
import 'package:clean_arch_bookly/core/use_cases/use_case.dart';
import 'package:either_dart/either.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'featured_books_cubit_state.dart';

class FeaturedBooksCubitCubit extends Cubit<FeaturedBooksCubitState> {
  final FeaturedBooksUseCase featuredBooksUseCase;
  FeaturedBooksCubitCubit(this.featuredBooksUseCase)
      : super(FeaturedBooksCubitInitial());

  Future<void> fetchFeaturedBooks() async {
    emit(FeaturedBooksCubitLoading());
    await featuredBooksUseCase.call().fold((failure) {
      emit(FeaturedBooksCubitFailure(failure.errMessage));
    }, (books) {
      emit(FeaturedBooksCubitSuccess(books));
    });
  }
}
