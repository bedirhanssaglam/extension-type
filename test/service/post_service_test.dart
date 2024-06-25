import 'dart:io';

import 'package:dio/dio.dart';
import 'package:extension_type_with_bloc/features/post/model/post.dart';
import 'package:extension_type_with_bloc/features/post/service/post_service.dart';
import 'package:extension_type_with_bloc/product/enums/network_paths.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'post_service_test.mocks.dart';

@GenerateMocks([Dio])
void main() {
  late MockDio mockDio;
  late PostService postService;

  setUp(() {
    mockDio = MockDio();
    postService = PostService();
    PostService.networkManager = mockDio;
  });

  group('fetchAllPosts', () {
    test('returns a list of posts if the http call completes successfully',
        () async {
      when(mockDio.get(NetworkPaths.posts.path))
          .thenAnswer((_) async => Response(
                data: [
                  {
                    'id': 1,
                    'title': 'Test Post',
                    'body': 'This is a test post'
                  },
                ],
                statusCode: HttpStatus.ok,
                requestOptions: RequestOptions(path: NetworkPaths.posts.path),
              ));

      final posts = await postService.fetchAllPosts();

      expect(posts, isA<List<Post>>());
      expect(posts?.length, 1);
      expect(posts?[0].id, 1);
      expect(posts?[0].title, 'Test Post');
      expect(posts?[0].body, 'This is a test post');
    });

    test('returns null if the http call completes with an error', () async {
      when(mockDio.get(NetworkPaths.posts.path))
          .thenAnswer((_) async => Response(
                data: 'Error',
                statusCode: HttpStatus.badRequest,
                requestOptions: RequestOptions(path: NetworkPaths.posts.path),
              ));

      final posts = await postService.fetchAllPosts();

      expect(posts, isNull);
    });
  });
}
