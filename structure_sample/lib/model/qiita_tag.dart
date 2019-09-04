import 'package:json_annotation/json_annotation.dart';

part 'qiita_tag.g.dart';

@JsonSerializable()
class QiitaTag {
  QiitaTag(this.id, this.iconUrl, this.followers, this.itemCount);

  final String id;
  final String iconUrl;
  final int followers;
  final int itemCount;

  factory QiitaTag.fromJson(Map<String, dynamic> json) =>
      _$QiitaTagFromJson(json);
}
