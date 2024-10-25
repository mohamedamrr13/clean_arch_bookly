import 'package:clean_arch_bookly/Features/home/domain/entities/book_entity.dart';
import 'package:clean_arch_bookly/Features/home/domain/repos/home_repo.dart';
import 'package:clean_arch_bookly/core/errors/failure.dart';
import 'package:clean_arch_bookly/core/use_cases/use_case.dart';
import 'package:either_dart/either.dart';

class NewestBooksUseCase extends UseCase<List<BookEntity>, NoParam> {
  HomeRepo homeRepo;
  NewestBooksUseCase(this.homeRepo);

  @override
  Future<Either<Failure, List<BookEntity>>> call([NoParam? param]) async {
    return await homeRepo.fetchNewestBooks();
  }
}
