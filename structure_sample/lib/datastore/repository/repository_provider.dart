import 'package:structure_sample/datastore/api/github/github_api_impl.dart';
import 'package:structure_sample/datastore/api/qiita/qiita_api_impl.dart';
import 'package:structure_sample/datastore/repository/github_repository.dart';
import 'package:structure_sample/datastore/repository/qiita_repository.dart';

class RepositoryProvider {
  static final gitHubRepository = GitHubRepository(GitHubApiImpl());
  static final qiitaRepository = QiitaRepository(QiitaApiImpl());
}
