import 'package:structure_sample/model/qiita_tag.dart';

abstract class QiitaApi {
  Future<List<QiitaTag>> getTags();

  Future<QiitaTag> getTag(String id);
}
