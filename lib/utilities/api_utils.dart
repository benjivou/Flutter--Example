import 'dart:convert';
import 'dart:ui';

import 'package:app/model/news.dart';
import 'package:app/private/private_keys.dart';
import 'package:country_codes/country_codes.dart';
import 'package:http/http.dart' as http;

/// Open the connection to the Api
class ApiUtils {
  final endPointUrl = "newsapi.org";
  final client = http.Client();

  /// Retrieve 20 news maximum about 'technology' written in the language of the os
  Future<List<News>> getNews() async {
    await CountryCodes.init();
    final Locale deviceLocale = CountryCodes.getDeviceLocale()!;
    final queryParameters = {
      'country': deviceLocale.countryCode,
      'category': 'technology',
      'apiKey': PrivateKeys.apiKey
    };
    final uri = Uri.https(endPointUrl, '/v2/top-headlines', queryParameters);
    final response = await client.get(uri);
    Map<String, dynamic> json = jsonDecode(response.body);
    List<dynamic> body = json['articles'];
    List<News> news = body.map((dynamic item) => News.fromJson(item)).toList();
    return news;
  }
}
