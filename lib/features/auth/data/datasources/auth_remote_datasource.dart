import 'package:dio/dio.dart';
import '../../../../core/network/dio_client.dart';
import '../models/user_model.dart';

abstract class AuthRemoteDataSource {
  Future<UserModel> login(String email, String password);
  Future<UserModel> getCurrentUser();
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final DioClient _dioClient;

  AuthRemoteDataSourceImpl(this._dioClient);

  @override
  Future<UserModel> login(String email, String password) async {
    // Simulated API call. In real app: _dioClient.dio.post(...)
    await Future.delayed(const Duration(seconds: 2));
    
    if (password != 'password123') {
      throw DioException(
        requestOptions: RequestOptions(path: '/login'),
        type: DioExceptionType.badResponse,
        response: Response(
          requestOptions: RequestOptions(path: '/login'),
          statusCode: 401,
          data: {'message': 'Invalid credentials'},
        ),
      );
    }

    return UserModel(id: '1', name: 'THiN-NA', email: email);
  }

  @override
  Future<UserModel> getCurrentUser() async {
    await Future.delayed(const Duration(seconds: 1));
    return const UserModel(id: '1', name: 'THiN-NA', email: 'user@example.com');
  }
}
