import 'package:structure_sample/model/license.dart';

abstract class GitHubApi {
  Future<List<License>> getLicenses();
}
