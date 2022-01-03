// GENERATED CODE - DO NOT MODIFY BY HAND

part of model;

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Post _$PostFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['postId', 'message', 'user'],
    disallowNullValues: const ['postId', 'message', 'user'],
  );
  return Post(
    json['postId'] as String,
    json['message'] as String,
    json['imageUrl'] as String? ?? '',
    json['videoUrl'] as String? ?? '',
    json['likeCount'] as int? ?? 0,
    (json['likeIds'] as List<dynamic>?)?.map((e) => e as String).toList() ?? [],
    ShortenUser.fromJson(json['user'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$PostToJson(Post instance) => <String, dynamic>{
      'postId': instance.postId,
      'message': instance.message,
      'imageUrl': instance.imageUrl,
      'videoUrl': instance.videoUrl,
      'likeCount': instance.likeCount,
      'likeIds': instance.likeIds,
      'user': instance.user,
    };

ShortenUser _$ShortenUserFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['uid'],
    disallowNullValues: const ['uid'],
  );
  return ShortenUser(
    json['uid'] as String,
    json['email'] as String? ?? '',
  );
}

Map<String, dynamic> _$ShortenUserToJson(ShortenUser instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'email': instance.email,
    };
