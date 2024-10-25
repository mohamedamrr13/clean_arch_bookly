import 'package:clean_arch_bookly/Features/home/data/data_sources/home_local_data_source.dart';
import 'package:clean_arch_bookly/Features/home/data/data_sources/home_remote_data_source_.dart';
import 'package:clean_arch_bookly/Features/home/domain/entities/book_entity.dart';
import 'package:clean_arch_bookly/Features/home/domain/repos/home_repo.dart';
import 'package:clean_arch_bookly/core/errors/failure.dart';
import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';

class HomeRepoImpl implements HomeRepo {
  HomeRemoteDataSource remoteDataSource;
  HomeLocalDataSource localDataSource;

  HomeRepoImpl({required this.localDataSource, required this.remoteDataSource});
  @override
  Future<Either<Failure, List<BookEntity>>> fetchFeaturedBooks() async {
    try {
      List<BookEntity> books;
      books = localDataSource.fetchFeatuedBooks();
      if (books.isNotEmpty) {
        return Right(books);
      }
      books = await remoteDataSource.fetchFeaturedBooks();
      return Right(books);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.from(e));
      } else {
        return Left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, List<BookEntity>>> fetchNewestBooks() async {
    try {
      List<BookEntity> books;
      books = localDataSource.fetchNewestBooks();
      if (books.isNotEmpty) {
        return Right(books);
      }
      books = await remoteDataSource.fetchNewestBooks();
      return Right(books);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.from(e));
      } else {
        return Left(ServerFailure(e.toString()));
      }
    }
  }
}
