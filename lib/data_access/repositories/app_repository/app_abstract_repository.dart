part of data_access;

abstract class AppAbstractRepository {
  AppAbstractRepository();

  factory AppAbstractRepository.createConcrete() => AppConcreteRepository();

  Future<List<Post>> getPost();
  Future<void> addPost(
      {required String message, String? imageUrl, String? videoUrl});
  Future<void> editPost(
      {required String postId,
      required String message,
      String? imageUrl,
      String? videoUrl});
  Future<void> deletePost({required String postId});
  Future<void> likePost({required String postId});
  Future<void> disLikePost({required String postId});
}
