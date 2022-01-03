part of model;

@JsonSerializable()
class ShortenUser {
  @JsonKey(required: true, disallowNullValue: true)
  final String uid;
  @JsonKey(defaultValue: '')
  final String? email;

  ShortenUser(this.uid, this.email);

  factory ShortenUser.fromJson(Map<String, dynamic> json) =>
      _$ShortenUserFromJson(json);

  Map<String, dynamic> toJson() => _$ShortenUserToJson(this);
}
