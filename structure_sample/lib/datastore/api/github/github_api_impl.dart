import 'package:dio/dio.dart';
import 'package:structure_sample/datastore/api/github/github_api.dart';
import 'package:structure_sample/model/license.dart';

class GitHubApiImpl implements GitHubApi {
  @override
  Future<List<License>> getLicenses() async {
    final dio = Dio()..options.baseUrl = "https://api.github.com";
    final Response response = await dio.get("/licenses");

    final List<dynamic> licenses = response.data;
    return licenses
        .map((item) => License.fromJson(item))
        .toList(growable: false);
  }
}
