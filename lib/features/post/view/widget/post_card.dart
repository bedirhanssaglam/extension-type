part of '../post_view.dart';

final class _PostCard extends StatelessWidget {
  const _PostCard({required this.post});

  final Post post;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Text(post.id.toString()),
        title: Text(post.title ?? ''),
        subtitle: Text(post.body ?? ''),
      ),
    );
  }
}
