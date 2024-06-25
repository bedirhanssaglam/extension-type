import 'package:extension_type_with_bloc/features/post/model/post.dart';
import 'package:extension_type_with_bloc/features/post/service/post_service.dart';
import 'package:extension_type_with_bloc/product/base/base_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final class PostViewModel extends Cubit<BaseState<List<Post>>> {
  PostViewModel(PostService postService)
      : _postService = postService,
        super(const BaseState<List<Post>>.initial());

  final PostService _postService;

  Future<void> fetchPosts() async {
    emit(const BaseState<List<Post>>.loading());
    try {
      final response = await _postService.fetchAllPosts();
      emit(BaseState<List<Post>>.data(response ?? []));
    } catch (_) {
      emit(const BaseState<List<Post>>.error());
    }
  }
}
