This project aims to demonstrate simple implementation of Dart's [extension type](https://dart.dev/language/extension-types) in handling different cases. You should not use this directly in your own project. This was created for the example.

```dart
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
```