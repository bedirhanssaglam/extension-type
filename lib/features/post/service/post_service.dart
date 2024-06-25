import 'dart:io';

import 'package:dio/dio.dart';
import 'package:extension_type_with_bloc/features/post/model/post.dart';
import 'package:extension_type_with_bloc/product/enums/network_paths.dart';
import 'package:extension_type_with_bloc/product/network/network_manager.dart';

class PostService {
  static Dio networkManager = NetworkManager.networkManager;

  Future<List<Post>?> fetchAllPosts() async {
    try {
      final response = await networkManager.get(NetworkPaths.posts.path);

      if (response.statusCode == HttpStatus.ok) {
        final data = response.data as List;
        return data.map((e) => Post.fromJson(e)).toList();
      } else {
        return null;
      }
    } catch (_) {
      return null;
    }
  }
}
