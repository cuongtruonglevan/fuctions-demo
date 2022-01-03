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

  Future<void> loadPost() async {
    emit(const HomeState.postLoading());
    try {
      final tempList = await appRepository.getPost();
      emit(HomeState.postLoaded(post: tempList, loading: false));
    } catch (e) {
      emit(HomeState.error(e.toString()));
    }
  }

  Future<void> addPost(
      {required String message, String? imageUrl, String? videoUrl}) async {
    final state = this.state;
    if (state is HomeStatePostLoaded) {
      emit(state.copyWith(loading: true));
      try {
        await appRepository.addPost(message: message);
      } catch (e) {
        appShowErrorDialog(overlayContext, e);
      } finally {
        emit(state.copyWith(loading: false));
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
      emit(state.copyWith(loading: true));
      try {
        await appRepository.editPost(postId: postId, message: message);
      } catch (e) {
        appShowErrorDialog(overlayContext, e);
      } finally {
        emit(state.copyWith(loading: false));
      }
    }
  }

  Future<void> deletePost({required String postId}) async {
    final state = this.state;
    if (state is HomeStatePostLoaded) {
      emit(state.copyWith(loading: true));
      try {
        await appRepository.deletePost(postId: postId);
      } catch (e) {
        appShowErrorDialog(overlayContext, e);
      } finally {
        emit(state.copyWith(loading: false));
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
