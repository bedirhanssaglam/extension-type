import 'package:extension_type_with_bloc/product/base/base_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

typedef DataBuilder<T> = Widget Function(T);

final class BaseBlocBuilder<T> extends StatelessWidget {
  const BaseBlocBuilder({
    required this.bloc,
    super.key,
    required this.dataBuilder,
  });

  final DataBuilder<T> dataBuilder;
  final StateStreamable<BaseState<T>> bloc;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StateStreamable<BaseState<T>>, BaseState<T>>(
      bloc: bloc,
      builder: (context, state) {
        return state.when(
          data: dataBuilder,
          error: (message) => Center(child: Text(message)),
          initial: SizedBox.shrink,
          loading: () =>
              const Center(child: CircularProgressIndicator.adaptive()),
        );
      },
    );
  }
}
