part of model;

@JsonSerializable()
class Post {
  @JsonKey(required: true, disallowNullValue: true)
  final String postId;
  @JsonKey(required: true, disallowNullValue: true)
  final String message;
  @JsonKey(defaultValue: '')
  final String? imageUrl;
  @JsonKey(defaultValue: '')
  final String? videoUrl;
  @JsonKey(defaultValue: 0)
  final int? likeCount;
  @JsonKey(defaultValue: <String>[])
  final List<String>? likeIds;
  @JsonKey(required: true, disallowNullValue: true)
  final ShortenUser user;

  Post(this.postId, this.message, this.imageUrl, this.videoUrl, this.likeCount,
      this.likeIds, this.user);

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);
  Map<String, dynamic> toJson() => _$PostToJson(this);
}
