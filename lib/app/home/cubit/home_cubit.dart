import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_bros_flutter/data_access/data_access.dart';
import 'package:my_bros_flutter/model/model.dart';
import 'package:my_bros_flutter/shared/app_util.dart';

part 'home_cubit.freezed.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final AppAbstractRepository appRepository;
  final GlobalKey<NavigatorState> navigatorKey;
  final BuildContext overlayContext;

  HomeCubit(
      {required this.appRepository,
      required this.navigatorKey,
      required this.overlayContext})
      : super(const HomeState.postLoading()) {
    loadPost();
  }

  List<Post> postLists = [];

  buildLoadedPostState() =>
      HomeState.postLoaded(post: postLists, loading: false);

  Future<void> loadPost() async {
    emit(const HomeState.postLoading());
    try {
      postLists = await appRepository.getPost();
      emit(buildLoadedPostState());
    } catch (e) {
      emit(HomeState.error(e.toString()));
    }
  }

  Future<void> addPost(
      {required String message, String? imageUrl, String? videoUrl}) async {
    final state = this.state;
    if (state is HomeStatePostLoaded) {
      showLoadingIndicator(overlayContext);
      try {
        await appRepository.addPost(message: message);
        postLists = await appRepository.getPost();
        emit(buildLoadedPostState());
      } catch (e) {
        appShowErrorDialog(overlayContext, e);
      } finally {
        Navigator.of(overlayContext, rootNavigator: true).pop();
      }
    }
  }

  Future<void> editPost(
      {required String postId,
      required String message,
      String? imageUrl,
      String? videoUrl}) async {
    final state = this.state;
    if (state is HomeStatePostLoaded) {
      showLoadingIndicator(overlayContext);
      try {
        await appRepository.editPost(postId: postId, message: message);
        postLists = await appRepository.getPost();
        emit(buildLoadedPostState());
      } catch (e) {
        appShowErrorDialog(overlayContext, e);
      } finally {
        hideLoadingIndicator(overlayContext);
      }
    }
  }

  Future<void> deletePost({required String postId}) async {
    final state = this.state;
    if (state is HomeStatePostLoaded) {
      showLoadingIndicator(overlayContext);
      try {
        await appRepository.deletePost(postId: postId);
        postLists = await appRepository.getPost();
        emit(buildLoadedPostState());
      } catch (e) {
        appShowErrorDialog(overlayContext, e);
      } finally {
        hideLoadingIndicator(overlayContext);
      }
    }
  }

  Future<void> likePost({required String postId}) async {
    try {
      await appRepository.likePost(postId: postId);
    } catch (e) {
      appShowErrorDialog(overlayContext, e);
    }
  }

  Future<void> disLikePost({required String postId}) async {
    try {
      await appRepository.disLikePost(postId: postId);
    } catch (e) {
      appShowErrorDialog(overlayContext, e);
    }
  }
}
