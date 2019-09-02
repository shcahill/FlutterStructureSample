import 'package:structure_sample/datastore/api/github/github_api_impl.dart';
import 'package:structure_sample/datastore/repository/github_repository.dart';

class RepositoryFactory {
  static final gitHubRepository = GitHubRepository(GitHubApiImpl());
}
