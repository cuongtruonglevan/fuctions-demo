import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:my_bros_flutter/app/home/cubit/home_cubit.dart';
import 'package:my_bros_flutter/model/model.dart';
import 'package:my_bros_flutter/shared/app_util.dart';

class PostItem extends StatelessWidget {
  final Post post;
  final RxBool isLiked;
  final bool isMyPost;

  PostItem(
      {Key? key,
      required this.post,
      required this.isLiked,
      required this.isMyPost})
      : super(key: key);

  final TextEditingController _messageController = TextEditingController();
  final RxBool beingLiked = false.obs;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Colors.blueGrey[100],
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.blueGrey[500]!,
            offset: const Offset(5.0, 5.0),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 30.0,
                height: 30.0,
                decoration: BoxDecoration(
                  color: Colors.blueGrey[300],
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    post.user.email!.substring(0, 2).toUpperCase(),
                  ),
                ),
              ),
              const SizedBox(width: 5.0),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 5.0),
                  Text(post.user.email!),
                ],
              ),
              const Spacer(),
              Tooltip(
                message: 'Post ID: ${post.postId}',
                verticalOffset: 5.0,
                child: Icon(
                  Icons.info,
                  color: Colors.blueGrey[300],
                ),
              ),
            ],
          ),
          const SizedBox(height: 10.0),
          Text(post.message),
          const SizedBox(height: 10.0),
          post.likeCount! > 0
              ? Row(
                  children: [
                    Icon(
                      Icons.thumb_up_rounded,
                      color: Colors.blueGrey[300],
                      size: 20.0,
                    ),
                    const SizedBox(width: 5.0),
                    Text(post.likeCount.toString()),
                  ],
                )
              : const SizedBox(),
          const SizedBox(height: 10.0),
          Container(
            width: double.infinity,
            height: 1.0,
            decoration: BoxDecoration(
              color: Colors.blueGrey[300],
              boxShadow: [
                BoxShadow(
                  color: Colors.blueGrey[500]!,
                  offset: const Offset(2.0, 2.0),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Visibility(
                visible: isMyPost,
                child: TextButton(
                  onPressed: () => deletePost(context, postId: post.postId),
                  child: Row(
                    children: [
                      Icon(
                        Icons.delete_rounded,
                        color: Colors.blueGrey[500],
                      ),
                      const SizedBox(width: 5.0),
                      Text(
                        'Delete',
                        style: TextStyle(
                          color: Colors.blueGrey[500],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Visibility(
                visible: isMyPost,
                child: TextButton(
                  onPressed: () async {
                    await editPost(context);
                    if (_messageController.text != post.message) {
                      await context.read<HomeCubit>().editPost(
                          postId: post.postId,
                          message: _messageController.text);
                      _messageController.clear();
                    }
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.edit_rounded,
                        color: Colors.blueGrey[500],
                      ),
                      const SizedBox(width: 5.0),
                      Text(
                        'Edit',
                        style: TextStyle(
                          color: Colors.blueGrey[500],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Obx(() => TextButton(
                    onPressed:
                        beingLiked.value ? null : () => likePost(context),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Row(
                          children: [
                            Icon(
                              isLiked.value
                                  ? Icons.thumb_up_rounded
                                  : Icons.thumb_up_outlined,
                              color: Colors.blueGrey[500],
                            ),
                            const SizedBox(width: 5.0),
                            Text(
                              'Like',
                              style: TextStyle(
                                color: Colors.blueGrey[500],
                              ),
                            )
                          ],
                        ),
                        Center(
                          child: Visibility(
                            visible: beingLiked.value,
                            child: const SpinKitThreeBounce(
                                size: 16.0, color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  )),
            ],
          ),
        ],
      ),
    );
  }

  Future<void> deletePost(BuildContext context,
      {required String postId}) async {
    await appShowConfirmDialog(
      context,
      title: 'Confirm',
      retryMessage: 'Do you want to delete this post ?',
      confirmAction: context.read<HomeCubit>().deletePost(postId: postId),
    );
  }

  Future editPost(BuildContext context) async {
    _messageController.text = post.message;
    await showModalBottomSheet(
      context: context,
      isDismissible: true,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        padding: const EdgeInsets.all(20.0),
        height: MediaQuery.of(context).size.height * 0.75,
        decoration: BoxDecoration(
          color: Colors.blueGrey[100],
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              children: [
                Text(
                  'Message',
                  style: TextStyle(fontSize: 16.0, color: Colors.blueGrey[500]),
                ),
                const Spacer(),
                IconButton(
                  highlightColor: Colors.blueGrey[500],
                  splashColor: Colors.blueGrey[500],
                  focusColor: Colors.blueGrey[500],
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: Icon(
                    Icons.cancel_rounded,
                    color: Colors.blueGrey[500],
                  ),
                ),
              ],
            ),
            TextField(
              controller: _messageController,
              maxLines: 5,
              keyboardType: TextInputType.multiline,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: 100.0,
              height: 40.0,
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Center(
                  child: Text(
                    'SAVE',
                    style: TextStyle(
                      color: Colors.blueGrey[500],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future likePost(BuildContext context) async {
    beingLiked.value = true;
    if (isLiked.value) {
      await context.read<HomeCubit>().disLikePost(postId: post.postId);
      isLiked.value = false;
    } else {
      await context.read<HomeCubit>().likePost(postId: post.postId);
      isLiked.value = true;
    }
    beingLiked.value = false;
  }
}
