import 'package:bloc_provider/bloc_provider.dart';
import 'package:structure_sample/datastore/data_store_handler.dart';
import 'package:structure_sample/datastore/repository/repository_provider.dart';
import 'package:structure_sample/model/qiita_tag.dart';

class QiitaBloc extends Bloc {
  QiitaBloc() {
    _dataStore = DataStoreHandler<String, QiitaTag>(
        source: (id) => _repository.getTag(id),
        comparison: (pre, next) => pre == next);
  }

  DataStoreHandler<String, QiitaTag> _dataStore;
  final _repository = RepositoryProvider.qiitaRepository;

  Stream<QiitaTag> get tag => _dataStore.onReceive;

  inputId(String id) => _dataStore.input(id);

  @override
  void dispose() {
    _dataStore.dispose();
  }
}
