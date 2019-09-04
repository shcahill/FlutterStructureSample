import 'package:json_annotation/json_annotation.dart';

part 'qiita_tag.g.dart';

@JsonSerializable()
class QiitaTag {
  QiitaTag(this.id, this.iconUrl, this.followers, this.itemCount);

  final String id;
  @JsonKey(name: "icon_url")
  final String iconUrl;
  @JsonKey(name: "followers_count")
  final int followers;
  @JsonKey(name: "item_count")
  final int itemCount;

  factory QiitaTag.fromJson(Map<String, dynamic> json) =>
      _$QiitaTagFromJson(json);
}
