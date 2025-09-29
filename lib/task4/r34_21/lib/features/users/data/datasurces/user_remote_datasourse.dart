import 'dart:convert';

import 'package:r34_21/core/constant/url_constant.dart';
import 'package:r34_21/core/error/exception.dart';
import 'package:r34_21/core/network/api_provider.dart';
import 'package:r34_21/features/users/data/models/user_model.dart';

abstract class UserRemoteDataSources  {
  Future<List<UsersModel>> getAllUser();
  Future<UsersModel> getUser(String id);
  Future<UsersModel> createUser(UsersModel user);
  Future<UsersModel> updateUser(UsersModel user);
  Future<bool> deleteUser(String id);
}

class UserRemoteDataSourcesImpl implements UserRemoteDataSources {
  final ApiProvider apiProvider;
  UserRemoteDataSourcesImpl({required this.apiProvider});
  static const _baseUrl = "${UrlConstant.baseURL}${UrlConstant.postsEndPoint}";

  @override
  Future<UsersModel> createUser(UsersModel user) async {
    try {
      final response = await apiProvider.Post('users', body: user.toJson());
      final Map<String, dynamic> data = jsonDecode(response);
      return UsersModel.fromJson(data);
    } catch (e) {
      rethrow;
    }
  }

  @override
 Future<bool> deleteUser(String id) async {
  try {

    await apiProvider.delete('${_baseUrl}/$id');

  return true;
  } catch (e) {
    
    print("Error in deleteUser: $e");
    

    throw ServerException();
  }
}

  @override
  Future<List<UsersModel>> getAllUser() async {
  try {
    
    final response = await apiProvider.get('${_baseUrl}?limit=100');
    final Map<String, dynamic> data =
        response is String ? jsonDecode(response) : response;

    
    final List usersJson = data['users'] as List;

    
    final List<UsersModel> users = usersJson
        .map((u) => UsersModel.fromJson(u as Map<String, dynamic>))
        .toList();

    return users;
  } catch (e) {
 
    print('Error in getAllUser: $e');
    
    throw ServerException();
  }
}



@override
Future<UsersModel> getUser(String id) async {
  try {
    final response = await apiProvider.get('$_baseUrl/$id');
    final Map<String, dynamic> data =
        response is String ? jsonDecode(response) : response;
    return UsersModel.fromJson(data);
  } catch (e) {
    print("Error in getUser: $e");
    throw ServerException();
  }
}



  @override
  Future<UsersModel> updateUser(UsersModel user) async {
  try {
    final body = user.toJson();

    final response = await apiProvider.put(
      '${_baseUrl}/${user.id}',
      body: body,
    );


    final Map<String, dynamic> data =
        response is String ? jsonDecode(response) : response;
    
     return UsersModel.fromJson(data);
  } catch (e) {
    print("Error in updateUser: $e");
    
    throw ServerException();
  }
}
}
