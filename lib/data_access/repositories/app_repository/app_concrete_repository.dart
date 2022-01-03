part of data_access;

class AppConcreteRepository extends AppAbstractRepository {
  final firebaseFunction = FirebaseFunctions.instance;
  final firebaseFirestore = FirebaseFirestore.instance;

  @override
  Future<void> addPost(
      {required String message, String? imageUrl, String? videoUrl}) async {
    final _param = {'message': message};
    if (imageUrl != null) {
      _param.addAll({'imageUrl': imageUrl});
    }
    if (videoUrl != null) {
      _param.addAll({'videoUrl': videoUrl});
    }
    await firebaseFunction.httpsCallable('addPost').call(_param);
  }

  @override
  Future<void> deletePost({required String postId}) async {
    final _param = {'postId': postId};
    await firebaseFunction.httpsCallable('deletePost').call(_param);
  }

  @override
  Future<void> disLikePost({required String postId}) async {
    final _param = {'postId': postId};
    await firebaseFunction.httpsCallable('dislikePost').call(_param);
  }

  @override
  Future<void> editPost(
      {required String postId,
      required String message,
      String? imageUrl,
      videoUrl}) async {
    final _param = {'postId': postId};
    await firebaseFunction.httpsCallable('dislikePost').call(_param);
  }

  @override
  Future<List<Post>> getPost() async {
    final List<Post> _tempList = [];
    final postRef = firebaseFirestore.collection('posts');
    final snapshot = await postRef.get();
    debugPrint('Post count: ' + snapshot.size.toString());
    for (var element in snapshot.docs) {
      final _post = Post.fromJson(element.data());
      _tempList.add(_post);
    }
    return _tempList;
  }

  @override
  Future<void> likePost({required String postId}) async {
    final _param = {'postId': postId};
    await firebaseFunction.httpsCallable('likePost').call(_param);
  }
}
