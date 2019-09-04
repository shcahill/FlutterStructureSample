// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'qiita_tag.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QiitaTag _$QiitaTagFromJson(Map<String, dynamic> json) {
  return QiitaTag(
    json['id'] as String,
    json['iconUrl'] as String,
    json['followers'] as int,
    json['itemCount'] as int,
  );
}

Map<String, dynamic> _$QiitaTagToJson(QiitaTag instance) => <String, dynamic>{
      'id': instance.id,
      'iconUrl': instance.iconUrl,
      'followers': instance.followers,
      'itemCount': instance.itemCount,
    };
