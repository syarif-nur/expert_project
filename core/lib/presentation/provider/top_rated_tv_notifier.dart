
import 'package:flutter/cupertino.dart';

import '../../domain/entities/tv.dart';
import '../../domain/usecases/get_top_rated_tv.dart';
import '../../utils/state_enum.dart';


class TopRatedTvNotifier extends ChangeNotifier {
  final GetTopRatedTv getTopRatedTv;

  TopRatedTvNotifier({required this.getTopRatedTv});

  RequestState _state = RequestState.Empty;

  RequestState get state => _state;

  List<Tv> _tv = [];

  List<Tv> get tv => _tv;

  String _message = '';

  String get message => _message;

  Future<void> fetchTopRatedTv() async {
    _state = RequestState.Loading;
    notifyListeners();

    final result = await getTopRatedTv.execute();

    result.fold(
      (failure) {
        _message = failure.message;
        _state = RequestState.Error;
        notifyListeners();
      },
      (tvData) {
        _tv = tvData;
        _state = RequestState.Loaded;
        notifyListeners();
      },
    );
  }
}
