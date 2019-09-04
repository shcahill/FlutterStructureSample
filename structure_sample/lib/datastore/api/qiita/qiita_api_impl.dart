import 'package:dio/dio.dart';
import 'package:structure_sample/datastore/api/qiita/qiita_api.dart';
import 'package:structure_sample/model/qiita_tag.dart';

class QiitaApiImpl implements QiitaApi {
  @override
  Future<List<QiitaTag>> getTags() async {
    final dio = Dio()..options.baseUrl = "https://qiita.com/api/v2";
    final Response response =
        await dio.get("/tags", queryParameters: {"page": 1, "sort": "count"});

    final List<dynamic> tags = response.data;
    return tags.map((item) => QiitaTag.fromJson(item)).toList(growable: false);
  }

  @override
  Future<QiitaTag> getTag(String id) async {
    final dio = Dio()..options.baseUrl = "https://qiita.com/api/v2";
    final Response response = await dio.get("/tags/$id");
    return QiitaTag.fromJson(response.data);
  }
}
