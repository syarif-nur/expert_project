import 'package:ditonton/data/models/genre_model.dart';
import 'package:ditonton/domain/entities/genre.dart';
import 'package:equatable/equatable.dart';

class TvDetail extends Equatable{

  TvDetail({
    required this.adult,
    required this.backdropPath,
    required this.episodeRunTime,
    required this.firstAirDate,
    required this.genres,
    required this.id,
    required this.name,
    required this.originalName,
    required this.overview,
    required this.posterPath,
    required this.voteAverage,
    required this.voteCount,
});

  final bool adult;
  final String backdropPath;
  final List<int> episodeRunTime;
  final DateTime firstAirDate;
  final List<Genre> genres;
  final int id;
  final String name;
  final String originalName;
  final String overview;
  final String posterPath;
  final double voteAverage;
  final int voteCount;

  @override
  List<Object?> get props => throw UnimplementedError();

}