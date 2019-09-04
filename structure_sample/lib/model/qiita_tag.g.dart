// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'qiita_tag.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QiitaTag _$QiitaTagFromJson(Map<String, dynamic> json) {
  return QiitaTag(
    json['id'] as String,
    json['icon_url'] as String,
    json['followers_count'] as int,
    json['item_count'] as int,
  );
}

Map<String, dynamic> _$QiitaTagToJson(QiitaTag instance) => <String, dynamic>{
      'id': instance.id,
      'icon_url': instance.iconUrl,
      'followers_count': instance.followers,
      'item_count': instance.itemCount,
    };
