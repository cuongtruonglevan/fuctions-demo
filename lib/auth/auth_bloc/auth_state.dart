part of 'auth_cubit.dart';

@Freezed()
abstract class AuthState with _$AuthState {
  const factory AuthState.authenticated({required User user}) = Authenticated;
  const factory AuthState.unauthenticated() = Unauthenticated;
  const factory AuthState.unknown() = Unknown;
}
