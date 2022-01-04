// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'sign_in_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$SignInStateTearOff {
  const _$SignInStateTearOff();

  SignInStateInitial initial(
      {required GlobalKey<State<StatefulWidget>> formKey,
      required TextEditingController emailController,
      required TextEditingController passwordController,
      required bool loading}) {
    return SignInStateInitial(
      formKey: formKey,
      emailController: emailController,
      passwordController: passwordController,
      loading: loading,
    );
  }
}

/// @nodoc
const $SignInState = _$SignInStateTearOff();

/// @nodoc
mixin _$SignInState {
  GlobalKey<State<StatefulWidget>> get formKey =>
      throw _privateConstructorUsedError;
  TextEditingController get emailController =>
      throw _privateConstructorUsedError;
  TextEditingController get passwordController =>
      throw _privateConstructorUsedError;
  bool get loading => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            GlobalKey<State<StatefulWidget>> formKey,
            TextEditingController emailController,
            TextEditingController passwordController,
            bool loading)
        initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(
            GlobalKey<State<StatefulWidget>> formKey,
            TextEditingController emailController,
            TextEditingController passwordController,
            bool loading)?
        initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            GlobalKey<State<StatefulWidget>> formKey,
            TextEditingController emailController,
            TextEditingController passwordController,
            bool loading)?
        initial,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SignInStateInitial value) initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(SignInStateInitial value)? initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SignInStateInitial value)? initial,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SignInStateCopyWith<SignInState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignInStateCopyWith<$Res> {
  factory $SignInStateCopyWith(
          SignInState value, $Res Function(SignInState) then) =
      _$SignInStateCopyWithImpl<$Res>;
  $Res call(
      {GlobalKey<State<StatefulWidget>> formKey,
      TextEditingController emailController,
      TextEditingController passwordController,
      bool loading});
}

/// @nodoc
class _$SignInStateCopyWithImpl<$Res> implements $SignInStateCopyWith<$Res> {
  _$SignInStateCopyWithImpl(this._value, this._then);

  final SignInState _value;
  // ignore: unused_field
  final $Res Function(SignInState) _then;

  @override
  $Res call({
    Object? formKey = freezed,
    Object? emailController = freezed,
    Object? passwordController = freezed,
    Object? loading = freezed,
  }) {
    return _then(_value.copyWith(
      formKey: formKey == freezed
          ? _value.formKey
          : formKey // ignore: cast_nullable_to_non_nullable
              as GlobalKey<State<StatefulWidget>>,
      emailController: emailController == freezed
          ? _value.emailController
          : emailController // ignore: cast_nullable_to_non_nullable
              as TextEditingController,
      passwordController: passwordController == freezed
          ? _value.passwordController
          : passwordController // ignore: cast_nullable_to_non_nullable
              as TextEditingController,
      loading: loading == freezed
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class $SignInStateInitialCopyWith<$Res>
    implements $SignInStateCopyWith<$Res> {
  factory $SignInStateInitialCopyWith(
          SignInStateInitial value, $Res Function(SignInStateInitial) then) =
      _$SignInStateInitialCopyWithImpl<$Res>;
  @override
  $Res call(
      {GlobalKey<State<StatefulWidget>> formKey,
      TextEditingController emailController,
      TextEditingController passwordController,
      bool loading});
}

/// @nodoc
class _$SignInStateInitialCopyWithImpl<$Res>
    extends _$SignInStateCopyWithImpl<$Res>
    implements $SignInStateInitialCopyWith<$Res> {
  _$SignInStateInitialCopyWithImpl(
      SignInStateInitial _value, $Res Function(SignInStateInitial) _then)
      : super(_value, (v) => _then(v as SignInStateInitial));

  @override
  SignInStateInitial get _value => super._value as SignInStateInitial;

  @override
  $Res call({
    Object? formKey = freezed,
    Object? emailController = freezed,
    Object? passwordController = freezed,
    Object? loading = freezed,
  }) {
    return _then(SignInStateInitial(
      formKey: formKey == freezed
          ? _value.formKey
          : formKey // ignore: cast_nullable_to_non_nullable
              as GlobalKey<State<StatefulWidget>>,
      emailController: emailController == freezed
          ? _value.emailController
          : emailController // ignore: cast_nullable_to_non_nullable
              as TextEditingController,
      passwordController: passwordController == freezed
          ? _value.passwordController
          : passwordController // ignore: cast_nullable_to_non_nullable
              as TextEditingController,
      loading: loading == freezed
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$SignInStateInitial implements SignInStateInitial {
  const _$SignInStateInitial(
      {required this.formKey,
      required this.emailController,
      required this.passwordController,
      required this.loading});

  @override
  final GlobalKey<State<StatefulWidget>> formKey;
  @override
  final TextEditingController emailController;
  @override
  final TextEditingController passwordController;
  @override
  final bool loading;

  @override
  String toString() {
    return 'SignInState.initial(formKey: $formKey, emailController: $emailController, passwordController: $passwordController, loading: $loading)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SignInStateInitial &&
            const DeepCollectionEquality().equals(other.formKey, formKey) &&
            const DeepCollectionEquality()
                .equals(other.emailController, emailController) &&
            const DeepCollectionEquality()
                .equals(other.passwordController, passwordController) &&
            const DeepCollectionEquality().equals(other.loading, loading));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(formKey),
      const DeepCollectionEquality().hash(emailController),
      const DeepCollectionEquality().hash(passwordController),
      const DeepCollectionEquality().hash(loading));

  @JsonKey(ignore: true)
  @override
  $SignInStateInitialCopyWith<SignInStateInitial> get copyWith =>
      _$SignInStateInitialCopyWithImpl<SignInStateInitial>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            GlobalKey<State<StatefulWidget>> formKey,
            TextEditingController emailController,
            TextEditingController passwordController,
            bool loading)
        initial,
  }) {
    return initial(formKey, emailController, passwordController, loading);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(
            GlobalKey<State<StatefulWidget>> formKey,
            TextEditingController emailController,
            TextEditingController passwordController,
            bool loading)?
        initial,
  }) {
    return initial?.call(formKey, emailController, passwordController, loading);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            GlobalKey<State<StatefulWidget>> formKey,
            TextEditingController emailController,
            TextEditingController passwordController,
            bool loading)?
        initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(formKey, emailController, passwordController, loading);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SignInStateInitial value) initial,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(SignInStateInitial value)? initial,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SignInStateInitial value)? initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class SignInStateInitial implements SignInState {
  const factory SignInStateInitial(
      {required GlobalKey<State<StatefulWidget>> formKey,
      required TextEditingController emailController,
      required TextEditingController passwordController,
      required bool loading}) = _$SignInStateInitial;

  @override
  GlobalKey<State<StatefulWidget>> get formKey;
  @override
  TextEditingController get emailController;
  @override
  TextEditingController get passwordController;
  @override
  bool get loading;
  @override
  @JsonKey(ignore: true)
  $SignInStateInitialCopyWith<SignInStateInitial> get copyWith =>
      throw _privateConstructorUsedError;
}
