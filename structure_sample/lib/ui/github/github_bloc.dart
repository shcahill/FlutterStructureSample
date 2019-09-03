import 'package:bloc_provider/bloc_provider.dart';
import 'package:rxdart/rxdart.dart';
import 'package:structure_sample/datastore/repository/repository_provider.dart';
import 'package:structure_sample/model/license.dart';

class GitHubBloc extends Bloc {
  final _behaviorSubject = BehaviorSubject<List<License>>();

  requestLicences() {
    _behaviorSubject.sink.add(null);
    RepositoryProvider.gitHubRepository.getLicenses().then((item) {
      _behaviorSubject.add(item);
    }).catchError((e) {
      _behaviorSubject.addError(e);
    });
  }

  Stream<List<License>> get licenseList => _behaviorSubject.stream;

  @override
  void dispose() {
    _behaviorSubject.close();
  }
}
