import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_bros_flutter/app/home/cubit/home_cubit.dart';
import 'package:my_bros_flutter/auth/auth_bloc/auth_cubit.dart';

class HomeScreen extends StatelessWidget {
  final User user;
  HomeScreen({Key? key, required this.user}) : super(key: key);

  final _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.light,
          child: Scaffold(
            backgroundColor: Colors.blueGrey[300],
            floatingActionButton: FloatingActionButton(
              onPressed: () async {
                await addOrEditPost(context);
                if (_messageController.text.isNotEmpty) {
                  await context
                      .read<HomeCubit>()
                      .addPost(message: _messageController.text);
                  _messageController.clear();
                }
              },
              backgroundColor: Colors.blueGrey[500],
              child: const Center(
                child: Text(
                  'ADD\nPOST',
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            body: state.maybeMap(
              orElse: () {
                Widget _child = const SizedBox();

                if (state is HomeStatePostLoaded) {
                  // CUONG.TRUONG on January/03/2022:
                  _child = _buildPostLoaded(context, state);
                } else if (state is HomeStateError) {
                  // CUONG.TRUONG on January/03/2022:
                  _child = _buildErrorLoaded(context, state.error);
                } else {
                  // CUONG.TRUONG on January/03/2022:
                  _child = _buildPostLoading(context);
                }
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 50.0),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Row(
                        children: [
                          Text(
                            _getGreetingText(user.email.toString()),
                            style: const TextStyle(
                                fontSize: 16.0, color: Colors.white),
                          ),
                          const Spacer(),
                          IconButton(
                            onPressed: () =>
                                BlocProvider.of<AuthCubit>(context).logOut(),
                            icon: const Icon(
                              Icons.person_outline_rounded,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    Expanded(child: _child),
                  ],
                );
              },
            ),
          ),
        );
      },
    );
  }

  Widget _buildPostLoading(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        color: Colors.white,
      ),
    );
  }

  Widget _buildErrorLoaded(BuildContext context, String errorMessage) {
    return Center(
      child: Text(errorMessage),
    );
  }

  Widget _buildPostLoaded(
      BuildContext context, HomeStatePostLoaded postLoadedState) {
    return ListView.separated(
      padding: const EdgeInsets.only(
          left: 20.0, top: 10.0, right: 20.0, bottom: 60.0),
      itemCount: postLoadedState.post.length,
      itemBuilder: (context, index) {
        final _post = postLoadedState.post.elementAt(index);
        final _liked = _post.likeIds!.contains(user.uid);
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
                        _post.user.email!.substring(0, 2).toUpperCase(),
                      ),
                    ),
                  ),
                  const SizedBox(width: 5.0),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 5.0),
                      Text(_post.user.email!),
                    ],
                  ),
                  const Spacer(),
                  Tooltip(
                    message: 'Post ID: ${_post.postId}',
                    verticalOffset: 5.0,
                    child: Icon(
                      Icons.info,
                      color: Colors.blueGrey[300],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10.0),
              Text(_post.message),
              const SizedBox(height: 10.0),
              _post.likeCount! > 0
                  ? Row(
                      children: [
                        Icon(
                          Icons.thumb_up_rounded,
                          color: Colors.blueGrey[300],
                          size: 20.0,
                        ),
                        const SizedBox(width: 5.0),
                        Text(_post.likeCount.toString()),
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
                  TextButton(
                    onPressed: () {
                      context
                          .read<HomeCubit>()
                          .deletePost(postId: _post.postId);
                    },
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
                  TextButton(
                    onPressed: () {},
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
                  TextButton(
                    onPressed: () {
                      if (_liked) {
                        context
                            .read<HomeCubit>()
                            .disLikePost(postId: _post.postId);
                      } else {
                        context
                            .read<HomeCubit>()
                            .likePost(postId: _post.postId);
                      }
                    },
                    child: Row(
                      children: [
                        Icon(
                          _liked
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
                  ),
                ],
              ),
            ],
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) => const SizedBox(
        height: 10.0,
      ),
    );
  }

  String _getGreetingText(String userName) {
    final _currentHour = DateTime.now().hour;
    String? _greeting;
    if (_currentHour >= 3) {
      _greeting = 'Good morning';
    }
    if (_currentHour >= 12) {
      _greeting = 'Good afternoon';
    }
    if (_currentHour >= 18) {
      _greeting = 'Good evening';
    }
    if (_currentHour >= 21 && _currentHour < 3) {
      _greeting = 'It\'s late night';
    }
    return '${_greeting ?? 'Hello'}, $userName';
  }

  Future addOrEditPost(BuildContext context) async {
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
                    'DONE',
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
}
