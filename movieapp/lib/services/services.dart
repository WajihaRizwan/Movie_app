import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:movieapp/models/moviemodel.dart';
import 'package:movieapp/util/utils.dart';

const baseUrl = "https://api.themoviedb.org/3/";
var key = "?api_key=$apiKey";
late String endPoint;

class ApiServices {
  Future<MovieModel> getUpcomingMovies() async {
    endPoint = 'movie/upcoming';
    final url = '$baseUrl$endPoint$key';

    final response = await http.get(
      Uri.parse(url),
    );
    if (response.statusCode == 200) {
      log('success upcoming');
      return MovieModel.fromJson(jsonDecode(response.body));
    }
    throw Exception('failed to load upcoming movies');
  }
  Future<MovieModel> getNowPlayingMovies() async {
    endPoint = 'movie/now_playing';
    final url = '$baseUrl$endPoint$key';

    final response = await http.get(
      Uri.parse(url),
    );
    if (response.statusCode == 200) {
      log('success now playing');
      return MovieModel.fromJson(jsonDecode(response.body));
    }
    throw Exception('failed to load Now Playing movies');
  }
}
