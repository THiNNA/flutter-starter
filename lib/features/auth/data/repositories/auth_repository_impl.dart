import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import '../../../../core/errors/error_handler.dart';
import '../../../../core/errors/failures.dart';
import '../../domain/entities/user.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_local_datasource.dart';
import '../datasources/auth_remote_datasource.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource _remoteDataSource;
  final AuthLocalDataSource _localDataSource;

  AuthRepositoryImpl(this._remoteDataSource, this._localDataSource);

  @override
  Future<Either<Failure, User>> login(String email, String password) async {
    try {
      final userModel = await _remoteDataSource.login(email, password);
      // Simulate token caching
      await _localDataSource.cacheToken('dummy_jwt_token_${userModel.id}');
      return Right(userModel);
    } on DioException catch (e) {
      return Left(ErrorHandler.handleDioError(e));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> logout() async {
    try {
      await _localDataSource.clearToken();
      return const Right(null);
    } catch (e) {
      return const Left(CacheFailure('Failed to clear cache'));
    }
  }

  @override
  Future<Either<Failure, User>> getCurrentUser() async {
    try {
      final userModel = await _remoteDataSource.getCurrentUser();
      return Right(userModel);
    } on DioException catch (e) {
      return Left(ErrorHandler.handleDioError(e));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
