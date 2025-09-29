import 'dart:convert';
import 'package:r34_21/core/constant/url_constant.dart';
import 'package:r34_21/core/error/exception.dart';
import 'package:r34_21/core/network/api_provider.dart';
import 'package:r34_21/features/posts/data/models/post_model.dart';
import 'package:r34_21/features/posts/domain/entities/post.dart';


abstract class PostRemoteDatasource {
  Future<List<Post>> getAllPost();
  Future<PostModel> getPost(String id);
  Future<PostModel> createPost(PostModel post);
  Future<PostModel> updatePost(PostModel post);
  Future<bool> deletePost(String id);
}

//test
class PostRemoteDatasourceImpl implements PostRemoteDatasource {
  final ApiProvider apiProvider;
  PostRemoteDatasourceImpl({required this.apiProvider});
  static const _baseUrl = "${UrlConstant.baseURL}${UrlConstant.postsEndPoint}";


  @override
  Future<PostModel>createPost(PostModel model) async {
    try {
      final body = model.toJsonForCreate();
      final Response = await apiProvider.Post("$_baseUrl/add", body: body);

      final Map<String, dynamic> data = Response is String
          ? jsonDecode(Response): Response;

      return PostModel.fromJson(data);
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<bool> deletePost(String id) async {
    try {
      await apiProvider.delete("$_baseUrl/$id");

      return true;
  
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<List<PostModel>> getAllPost() async {
    try {
      final Response = await apiProvider.get('$_baseUrl? limit=100');
      final Map<String, dynamic> data = Response is String
          ? jsonDecode(Response)
          : Response;
      final List postJson = data["posts"] as List;
      return postJson
          .map((p) => PostModel.fromJson(p as Map<String, dynamic>))
          .toList();
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future <PostModel>getPost(String id) async {
    try {
      final Response = await apiProvider.get("$_baseUrl/$id");
      final Map<String, dynamic> data = Response is String
          ? jsonDecode(Response)
          : Response;

      return PostModel.fromJson(data);
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<PostModel> updatePost(PostModel post ) async {
    try {
      final Response = await apiProvider.put(
        "$_baseUrl/${post.id}",
        body: post.toJson());
            final Map<String, dynamic> data = Response is String
          ? jsonDecode(Response)
          : Response;
      

      return PostModel.fromJson(data);
   
    } catch (e) {
      throw ServerException();
    }
  }
}
