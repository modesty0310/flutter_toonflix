import 'dart:convert';

import 'package:flutter_toonflix/models/webtoon_detail_model.dart';
import 'package:flutter_toonflix/models/webtoon_episode_model.dart';
import 'package:flutter_toonflix/models/webtoon_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl =
      'https://webtoon-crawler.nomadcoders.workers.dev';
  static const String today = 'today';

  static Future<List<WebtoonModel>> getTodaysToons() async {
    List<WebtoonModel> webtoonList = [];
    final url = Uri.parse('$baseUrl/$today');
    final res = await http.get(url);
    if (res.statusCode == 200) {
      final List<dynamic> webtoons = jsonDecode(res.body);
      for (var webtoon in webtoons) {
        webtoonList.add(WebtoonModel.fromJson(webtoon));
      }
      return webtoonList;
    }
    throw Error();
  }

  static Future<WebtoonDetailModel> getWebtonDetail(String id) async {
    final url = Uri.parse('$baseUrl/$id');
    final res = await http.get(url);

    if (res.statusCode == 200) {
      return WebtoonDetailModel.fromJson(jsonDecode(res.body));
    }
    throw Error();
  }

  static Future<List<WebtoonEpisodeModel>> getWebtonEpisodes(String id) async {
    List<WebtoonEpisodeModel> episodeList = [];
    final url = Uri.parse('$baseUrl/$id/episodes');
    final res = await http.get(url);

    if (res.statusCode == 200) {
      final List<dynamic> episodes = jsonDecode(res.body);
      for (var episode in episodes) {
        episodeList.add(WebtoonEpisodeModel.fromJson(episode));
      }
      return episodeList;
    }
    throw Error();
  }
}
