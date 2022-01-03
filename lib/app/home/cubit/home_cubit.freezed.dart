// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'home_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$HomeStateTearOff {
  const _$HomeStateTearOff();

  HomeStatePostLoading postLoading() {
    return const HomeStatePostLoading();
  }

  HomeStatePostLoaded postLoaded(
      {required List<Post> post, required bool loading}) {
    return HomeStatePostLoaded(
      post: post,
      loading: loading,
    );
  }

  HomeStateError error(String error) {
    return HomeStateError(
      error,
    );
  }
}

/// @nodoc
const $HomeState = _$HomeStateTearOff();

/// @nodoc
mixin _$HomeState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() postLoading,
    required TResult Function(List<Post> post, bool loading) postLoaded,
    required TResult Function(String error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? postLoading,
    TResult Function(List<Post> post, bool loading)? postLoaded,
    TResult Function(String error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? postLoading,
    TResult Function(List<Post> post, bool loading)? postLoaded,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(HomeStatePostLoading value) postLoading,
    required TResult Function(HomeStatePostLoaded value) postLoaded,
    required TResult Function(HomeStateError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(HomeStatePostLoading value)? postLoading,
    TResult Function(HomeStatePostLoaded value)? postLoaded,
    TResult Function(HomeStateError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HomeStatePostLoading value)? postLoading,
    TResult Function(HomeStatePostLoaded value)? postLoaded,
    TResult Function(HomeStateError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeStateCopyWith<$Res> {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) then) =
      _$HomeStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$HomeStateCopyWithImpl<$Res> implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._value, this._then);

  final HomeState _value;
  // ignore: unused_field
  final $Res Function(HomeState) _then;
}

/// @nodoc
abstract class $HomeStatePostLoadingCopyWith<$Res> {
  factory $HomeStatePostLoadingCopyWith(HomeStatePostLoading value,
          $Res Function(HomeStatePostLoading) then) =
      _$HomeStatePostLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class _$HomeStatePostLoadingCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res>
    implements $HomeStatePostLoadingCopyWith<$Res> {
  _$HomeStatePostLoadingCopyWithImpl(
      HomeStatePostLoading _value, $Res Function(HomeStatePostLoading) _then)
      : super(_value, (v) => _then(v as HomeStatePostLoading));

  @override
  HomeStatePostLoading get _value => super._value as HomeStatePostLoading;
}

/// @nodoc

class _$HomeStatePostLoading implements HomeStatePostLoading {
  const _$HomeStatePostLoading();

  @override
  String toString() {
    return 'HomeState.postLoading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is HomeStatePostLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() postLoading,
    required TResult Function(List<Post> post, bool loading) postLoaded,
    required TResult Function(String error) error,
  }) {
    return postLoading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? postLoading,
    TResult Function(List<Post> post, bool loading)? postLoaded,
    TResult Function(String error)? error,
  }) {
    return postLoading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? postLoading,
    TResult Function(List<Post> post, bool loading)? postLoaded,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (postLoading != null) {
      return postLoading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(HomeStatePostLoading value) postLoading,
    required TResult Function(HomeStatePostLoaded value) postLoaded,
    required TResult Function(HomeStateError value) error,
  }) {
    return postLoading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(HomeStatePostLoading value)? postLoading,
    TResult Function(HomeStatePostLoaded value)? postLoaded,
    TResult Function(HomeStateError value)? error,
  }) {
    return postLoading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HomeStatePostLoading value)? postLoading,
    TResult Function(HomeStatePostLoaded value)? postLoaded,
    TResult Function(HomeStateError value)? error,
    required TResult orElse(),
  }) {
    if (postLoading != null) {
      return postLoading(this);
    }
    return orElse();
  }
}

abstract class HomeStatePostLoading implements HomeState {
  const factory HomeStatePostLoading() = _$HomeStatePostLoading;
}

/// @nodoc
abstract class $HomeStatePostLoadedCopyWith<$Res> {
  factory $HomeStatePostLoadedCopyWith(
          HomeStatePostLoaded value, $Res Function(HomeStatePostLoaded) then) =
      _$HomeStatePostLoadedCopyWithImpl<$Res>;
  $Res call({List<Post> post, bool loading});
}

/// @nodoc
class _$HomeStatePostLoadedCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res>
    implements $HomeStatePostLoadedCopyWith<$Res> {
  _$HomeStatePostLoadedCopyWithImpl(
      HomeStatePostLoaded _value, $Res Function(HomeStatePostLoaded) _then)
      : super(_value, (v) => _then(v as HomeStatePostLoaded));

  @override
  HomeStatePostLoaded get _value => super._value as HomeStatePostLoaded;

  @override
  $Res call({
    Object? post = freezed,
    Object? loading = freezed,
  }) {
    return _then(HomeStatePostLoaded(
      post: post == freezed
          ? _value.post
          : post // ignore: cast_nullable_to_non_nullable
              as List<Post>,
      loading: loading == freezed
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$HomeStatePostLoaded implements HomeStatePostLoaded {
  const _$HomeStatePostLoaded({required this.post, required this.loading});

  @override
  final List<Post> post;
  @override
  final bool loading;

  @override
  String toString() {
    return 'HomeState.postLoaded(post: $post, loading: $loading)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is HomeStatePostLoaded &&
            const DeepCollectionEquality().equals(other.post, post) &&
            const DeepCollectionEquality().equals(other.loading, loading));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(post),
      const DeepCollectionEquality().hash(loading));

  @JsonKey(ignore: true)
  @override
  $HomeStatePostLoadedCopyWith<HomeStatePostLoaded> get copyWith =>
      _$HomeStatePostLoadedCopyWithImpl<HomeStatePostLoaded>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() postLoading,
    required TResult Function(List<Post> post, bool loading) postLoaded,
    required TResult Function(String error) error,
  }) {
    return postLoaded(post, loading);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? postLoading,
    TResult Function(List<Post> post, bool loading)? postLoaded,
    TResult Function(String error)? error,
  }) {
    return postLoaded?.call(post, loading);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? postLoading,
    TResult Function(List<Post> post, bool loading)? postLoaded,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (postLoaded != null) {
      return postLoaded(post, loading);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(HomeStatePostLoading value) postLoading,
    required TResult Function(HomeStatePostLoaded value) postLoaded,
    required TResult Function(HomeStateError value) error,
  }) {
    return postLoaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(HomeStatePostLoading value)? postLoading,
    TResult Function(HomeStatePostLoaded value)? postLoaded,
    TResult Function(HomeStateError value)? error,
  }) {
    return postLoaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HomeStatePostLoading value)? postLoading,
    TResult Function(HomeStatePostLoaded value)? postLoaded,
    TResult Function(HomeStateError value)? error,
    required TResult orElse(),
  }) {
    if (postLoaded != null) {
      return postLoaded(this);
    }
    return orElse();
  }
}

abstract class HomeStatePostLoaded implements HomeState {
  const factory HomeStatePostLoaded(
      {required List<Post> post,
      required bool loading}) = _$HomeStatePostLoaded;

  List<Post> get post;
  bool get loading;
  @JsonKey(ignore: true)
  $HomeStatePostLoadedCopyWith<HomeStatePostLoaded> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeStateErrorCopyWith<$Res> {
  factory $HomeStateErrorCopyWith(
          HomeStateError value, $Res Function(HomeStateError) then) =
      _$HomeStateErrorCopyWithImpl<$Res>;
  $Res call({String error});
}

/// @nodoc
class _$HomeStateErrorCopyWithImpl<$Res> extends _$HomeStateCopyWithImpl<$Res>
    implements $HomeStateErrorCopyWith<$Res> {
  _$HomeStateErrorCopyWithImpl(
      HomeStateError _value, $Res Function(HomeStateError) _then)
      : super(_value, (v) => _then(v as HomeStateError));

  @override
  HomeStateError get _value => super._value as HomeStateError;

  @override
  $Res call({
    Object? error = freezed,
  }) {
    return _then(HomeStateError(
      error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$HomeStateError implements HomeStateError {
  const _$HomeStateError(this.error);

  @override
  final String error;

  @override
  String toString() {
    return 'HomeState.error(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is HomeStateError &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(error));

  @JsonKey(ignore: true)
  @override
  $HomeStateErrorCopyWith<HomeStateError> get copyWith =>
      _$HomeStateErrorCopyWithImpl<HomeStateError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() postLoading,
    required TResult Function(List<Post> post, bool loading) postLoaded,
    required TResult Function(String error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? postLoading,
    TResult Function(List<Post> post, bool loading)? postLoaded,
    TResult Function(String error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? postLoading,
    TResult Function(List<Post> post, bool loading)? postLoaded,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this.error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(HomeStatePostLoading value) postLoading,
    required TResult Function(HomeStatePostLoaded value) postLoaded,
    required TResult Function(HomeStateError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(HomeStatePostLoading value)? postLoading,
    TResult Function(HomeStatePostLoaded value)? postLoaded,
    TResult Function(HomeStateError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HomeStatePostLoading value)? postLoading,
    TResult Function(HomeStatePostLoaded value)? postLoaded,
    TResult Function(HomeStateError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class HomeStateError implements HomeState {
  const factory HomeStateError(String error) = _$HomeStateError;

  String get error;
  @JsonKey(ignore: true)
  $HomeStateErrorCopyWith<HomeStateError> get copyWith =>
      throw _privateConstructorUsedError;
}
