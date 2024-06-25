import 'package:extension_type_with_bloc/features/post/service/post_service.dart';
import 'package:extension_type_with_bloc/features/post/view/post_view.dart';
import 'package:extension_type_with_bloc/features/post/view_model/post_view_model.dart';
import 'package:flutter/material.dart';

/// Manage home view business logic
base mixin PostViewMixin on State<PostView> {
  late final PostViewModel _postViewModel;

  PostViewModel get homeViewModel => _postViewModel;

  @override
  void initState() {
    super.initState();
    _postViewModel = PostViewModel(PostService())..fetchPosts();
  }
}
