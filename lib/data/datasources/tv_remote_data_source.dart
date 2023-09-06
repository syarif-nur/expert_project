import 'dart:convert';

import 'package:ditonton/data/models/tv_model.dart';
import 'package:ditonton/common/exception.dart';
import 'package:ditonton/data/models/tv_response.dart';
import 'package:http/http.dart' as http;

import '../models/tv_detail_model.dart';

abstract class TvRemoteDataSource {
  Future<List<TvModel>> getNowPlayingTvSeries();
  Future<TvDetailResponse> getTvDetail(int id);

}

class TvRemoteDataSourceImpl implements TvRemoteDataSource {
  static const API_KEY = 'api_key=2174d146bb9c0eab47529b2e77d6b526';
  static const BASE_URL = 'https://api.themoviedb.org/3';

  final http.Client client;

  TvRemoteDataSourceImpl({required this.client});

  @override
  Future<List<TvModel>> getNowPlayingTvSeries() async {
    final response =
        await client.get(Uri.parse('$BASE_URL/tv/airing_today?$API_KEY'));

    if (response.statusCode == 200) {
      return TvResponse.fromJson(json.decode(response.body)).results;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<TvDetailResponse> getTvDetail(int id) async {
    final response =
    await client.get(Uri.parse('$BASE_URL/tv/$id?$API_KEY'));

    if (response.statusCode == 200) {
      return TvDetailResponse.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }
}
