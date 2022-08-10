import 'dart:convert';

import 'package:films/src/models/films_models.dart';
import 'package:http/http.dart' as http;

class FilmsProvider {
  final String _apiKey = "2d776348e492ea1f60f7e19e0a1ac526";
  final String _url = "api.themoviedb.org";
  final String _language = "es-ES";

  Future<Films> getNowPlaying() async {
    final url = Uri.https(_url, "3/movie/now_playing",
        {"api_key": _apiKey, "language": _language});
    return await _responseProcess(url);
  }

  Future<Films> getPopulars() async {
    final url = Uri.https(
        _url, "3/movie/popular", {"api_key": _apiKey, "language": _language});
    return await _responseProcess(url);
  }

  Future<Films> _responseProcess(Uri url) async {
    final response = await http.get(url);
    final decodesData = json.decode(response.body);
    return Films.fromJson(decodesData);
  }
}
