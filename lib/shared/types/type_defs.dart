import 'package:fpdart/fpdart.dart';
import '../../core/errors/failures.dart';

/// Common typedefs to reduce boilerplate.
typedef FutureEither<T> = Future<Either<Failure, T>>;
typedef FutureVoid = FutureEither<void>;
