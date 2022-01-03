part of 'home_cubit.dart';

@Freezed()
abstract class HomeState with _$HomeState {
  const factory HomeState.postLoading() = HomeStatePostLoading;
  const factory HomeState.postLoaded(
      {required List<Post> post, required bool loading}) = HomeStatePostLoaded;
  const factory HomeState.error(String error) = HomeStateError;
}
