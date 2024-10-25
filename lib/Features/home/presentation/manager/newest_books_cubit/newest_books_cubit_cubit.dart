import 'package:clean_arch_bookly/Features/home/domain/entities/book_entity.dart';
import 'package:clean_arch_bookly/Features/home/domain/use_cases/newest_books_use_case.dart';
import 'package:either_dart/either.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'newest_books_cubit_state.dart';

class NewestBooksCubitCubit extends Cubit<NewestBooksCubitState> {

  final NewestBooksUseCase newestBooksUseCase;
  NewestBooksCubitCubit(this.newestBooksUseCase)
      : super(NewestBooksCubitInitial());

  Future<void> fetchFeaturedBooks() async {
    emit(NewestBooksCubitLoading());
    await newestBooksUseCase.call().fold((failure) {
      emit(NewestBooksCubitFailure(failure.errMessage));
    }, (books) {
      emit(NewestBooksCubitSuccess(books));
    });
  }
}

}
