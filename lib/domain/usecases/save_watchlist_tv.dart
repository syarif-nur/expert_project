import 'package:dartz/dartz.dart';
import 'package:ditonton/domain/entities/tv_detail.dart';
import 'package:ditonton/domain/repositories/tv_repository.dart';

import '../../common/failure.dart';

class SaveWatchListTv{
  final TvRepository repository;

  SaveWatchListTv(this.repository);

  Future<Either<Failure, String>> execute(TvDetail tv) {
    return repository.saveWatchlistTv(tv);
  }
}