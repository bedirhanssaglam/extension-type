import 'package:extension_type_with_bloc/product/constants/app_constants.dart';
import 'package:flutter/material.dart';

extension type const BaseState<T>._(({T value})? _) {
  const factory BaseState.initial() = _Initial;
  const factory BaseState.loading() = _Loading;
  const factory BaseState.data(T value) = _Data<T>;
  const factory BaseState.error() = _Error;
}

extension type const _Initial<T>._(Null _) implements BaseState<Never> {
  const _Initial() : this._(null);
}

extension type const _Loading<T>._(Null _) implements BaseState<Never> {
  const _Loading() : this._(null);
}

extension type const _Data<T>._(({T value}) _) implements BaseState<T> {
  const _Data(T value) : this._((value: value));
  T get value => _.value;
}

extension type const _Error<T>._(Null _) implements BaseState<Never> {
  const _Error() : this._(null);
}

extension WidgetBuilder<T> on BaseState<T> {
  Widget when({
    required Widget Function() loading,
    required Widget Function(T data) data,
    required Widget Function() initial,
    required Widget Function(String error) error,
  }) {
    if (this is _Loading<T>) {
      return loading();
    } else if (this is _Data<T>) {
      return data((this as _Data<T>)._.value);
    } else if (this is _Initial<T>) {
      return initial();
    } else if (this is _Error<T>) {
      return error(AppConstants.errorMessage);
    } else {
      return const SizedBox.shrink();
    }
  }
}
