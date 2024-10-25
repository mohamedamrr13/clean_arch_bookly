import 'package:clean_arch_bookly/core/errors/failure.dart';
import 'package:either_dart/either.dart';

abstract class UseCase<Type, Param> {
  Future<Either<Failure, Type>> call([Param param]);
}

class NoParam {}
