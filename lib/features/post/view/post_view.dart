import 'package:extension_type_with_bloc/features/post/model/post.dart';
import 'package:extension_type_with_bloc/features/post/view/mixin/post_view_mixin.dart';
import 'package:extension_type_with_bloc/product/components/bloc_builder/base_bloc_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'widget/post_card.dart';

final class PostView extends StatefulWidget {
  const PostView({super.key});

  @override
  State<PostView> createState() => _PostViewState();
}

final class _PostViewState extends State<PostView> with PostViewMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => homeViewModel,
        child: BaseBlocBuilder<List<Post>>(
          bloc: homeViewModel,
          dataBuilder: (List<Post> posts) => ListView.separated(
            itemCount: posts.length,
            itemBuilder: (context, index) => _PostCard(post: posts[index]),
            separatorBuilder: (context, index) => const Divider(),
          ),
        ),
      ),
    );
  }
}
