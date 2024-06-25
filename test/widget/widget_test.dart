import 'package:extension_type_with_bloc/product/base/base_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('BaseState when', () {
    testWidgets('returns busy widget when state is Loading',
        (WidgetTester tester) async {
      const state = BaseState.loading();
      const loadingWidget = Text('Loading');

      final widget = state.when(
        loading: () => loadingWidget,
        data: (data) => Text('Data: $data'),
        initial: () => const Text('Initial'),
        error: (error) => Text('Error: $error'),
      );

      expect(widget, equals(loadingWidget));
    });

    testWidgets('returns data widget when state is Data',
        (WidgetTester tester) async {
      const state = BaseState.data('Sample Data');

      final widget = state.when(
        loading: () => const Text('Loading'),
        data: (data) => Text('Data: $data'),
        initial: () => const Text('Initial'),
        error: (error) => Text('Error: $error'),
      );

      expect((widget as Text).data, equals('Data: Sample Data'));
    });
  });
}
