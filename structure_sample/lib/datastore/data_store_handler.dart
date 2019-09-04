import 'dart:async';

import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart';

/// DataStoreのリクエストキーと結果のセット
class DataStoreResult<T1, T2> {
  DataStoreResult({this.requestKey, this.requestResult});

  final T1 requestKey;
  final T2 requestResult;
}

/// DataStoreリクエスト処理
typedef Future<T2> DataStoreRequestFunction<T1, T2>(T1 param);

/// DataStoreリクエストキーの一致判定処理
typedef bool RequestKeyComparison<T>(T pre, T next);

/// DataStoreリクエストの多重リクエスト、エラー、キャンセルをハンドリングします
/// 終了時には必ず[dispose]をコールしてください
class DataStoreHandler<T1, T2> {
  DataStoreHandler(
      {@required DataStoreRequestFunction<T1, T2> source,
      RequestKeyComparison<T1> comparison})
      : _source = source,
        _keyComparison = comparison ?? ((pre, next) => pre == next) {
    _initialize();
  }

  _initialize() {
    _publisher.stream.listen((key) {
      // 最後のリクエストオブジェクト
      final lastResult = _behavior.value;

      // 同一通信判定
      if (_keyComparison(key, lastResult?.requestKey)) {
        if (_subscription != null) {
          // 同じリクエストを実行中
          return;
        }

        if (lastResult?.requestResult != null) {
          // 既に通信結果を持っている
          return;
        }
      }

      // 既存の通信は破棄
      _subscription?.cancel();
      // 取得中であることを示すため、requestKeyのみ入った[APIResult]をaddします
      _behavior.add(DataStoreResult(requestKey: key));
      // 新規リクエスト
      _subscription = _source(key).asStream().listen((T2 value) {
        _finishRequest();
        return _behavior
            .add(DataStoreResult(requestKey: key, requestResult: value));
      }, onError: (error, stackTrace) {
        _behavior.addError(error, stackTrace);
        _finishRequest();
      });
    });
  }

  _finishRequest() {
    // 通信のSubscriptionを破棄します。nullにするのは通信中判定にオブジェクトの存在をチェックしているためです。
    _subscription?.cancel();
    _subscription = null;
  }

  final DataStoreRequestFunction<T1, T2> _source;

  final RequestKeyComparison<T1> _keyComparison;

  /// API通信の引数Stream
  final _publisher = PublishSubject<T1>();

  /// API通信の引数と結果のStream
  final _behavior = BehaviorSubject<DataStoreResult<T1, T2>>.seeded(null);

  /// 通信Subscription（多重通信の制御およびキャンセルに使用します）
  StreamSubscription<T2> _subscription;

  /// region 公開メソッド
  /// データ取得結果をStreamで購読します
  Stream<T2> get onReceive =>
      _behavior.stream.map((result) => result?.requestResult);

  /// 必要に応じてデータ取得を実行します
  input(T1 value) => _publisher.add(value);

  cancel() {
    _finishRequest();
  }

  /// 終了処理です。必ず呼んでください。
  dispose() {
    _finishRequest();
    _behavior.close();
  }

  /// endregion
}
