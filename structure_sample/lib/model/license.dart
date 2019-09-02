import 'package:json_annotation/json_annotation.dart';

part 'license.g.dart';

@JsonSerializable()
class License {
  License(this.key, this.name, this.url);

  final String key;
  final String name;
  final String url;

  factory License.fromJson(Map<String, dynamic> json) =>
      _$LicenseFromJson(json);
}
