import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_app/core/error/failure.dart';

// abstract class BaseUseCase<T> {
//   Future<Either<Failure, T>> call();
// }

abstract class BaseUseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params param);
}

class NoParams extends Equatable {
  const NoParams();

  @override
  List<Object?> get props => [];
}
