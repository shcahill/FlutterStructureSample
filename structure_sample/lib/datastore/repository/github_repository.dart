import 'package:structure_sample/datastore/api/github/github_api.dart';
import 'package:structure_sample/model/license.dart';

class GitHubRepository {
  final GitHubApi _api;

  GitHubRepository(this._api);

  Future<List<License>> getLicenses() async {
    return await _api.getLicenses();
  }
}
