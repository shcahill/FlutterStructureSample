import 'package:structure_sample/datastore/api/qiita/qiita_api.dart';
import 'package:structure_sample/model/qiita_tag.dart';

class QiitaRepository {
  final QiitaApi _api;

  QiitaRepository(this._api);

  Future<List<QiitaTag>> getTags() async {
    return await _api.getTags();
  }

  Future<QiitaTag> getTag(String id) async {
    return await _api.getTag(id);
  }
}
