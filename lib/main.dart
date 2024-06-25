import 'package:extension_type_with_bloc/features/post/view/post_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const _MyApp());
}

final class _MyApp extends StatelessWidget {
  const _MyApp();

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PostView(),
    );
  }
}
