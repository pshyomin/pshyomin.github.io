import 'dart:convert';
import 'dart:math';

import 'package:http/http.dart' as http;
import 'package:xml2json/xml2json.dart';

import '../config.dart';
import '/models/weather/daily_model.dart';
import '/models/weather/dust_model.dart';
import '/models/weather/geo_model.dart';
import '/models/weather/live_day_model.dart';
import '/models/weather/live_model.dart';
import '/models/weather/sun_model.dart';

class APIClientManager {
  final http.Client client;
  APIClientManager({
    required this.client,
  });

  final headers = {'Accept-Charset': 'charset=utf-8', 'Origin': ''};
  final String domain = 'www.uridongnae.com';

  Future<Live> fetchLive(
      Point<num> latlong, String baseData, String hour, String minute) async {
    int iHour = int.parse(hour);

    if (iHour != 0) {
      iHour -= 1;
      if (iHour < 0) iHour = 23;
    }

    var url =
        'https://$domain:80/api/live/$baseData/$iHour/${latlong.x}/${latlong.y}';
    final response = await client.get(Uri.parse(url), headers: headers);
    if (response.statusCode != 200) {
      throw Exception('error api');
    }

    var live = jsonDecode(response.body);

    return Live.fromJson(live);
  }

  Future<LiveDayModel> fetchLiveDay(
      Point<num> latlong, String baseData, String hour, String minute) async {
    int iHour = int.parse(hour);
    int iMinute = int.parse(minute);

    if (iMinute > 45) {
      if (iHour != 0) {
        iHour -= 1;
        if (iHour < 0) iHour = 23;
      }
      iMinute = 45;
    }

    var url =
        'https://$domain:80/api/liveday/$baseData/$iHour/$iMinute/${latlong.x}/${latlong.y}';

    final response = await client.get(Uri.parse(url), headers: headers);
    if (response.statusCode != 200) {
      throw Exception('error api');
    }

    var liveDay = jsonDecode(response.body);

    return LiveDayModel.fromJson(liveDay);
  }

  Future<Daily> fetchDaily(
      Point<num> latlong, String baseData, String hour) async {
    int iData = int.parse(baseData);
    int iHour = int.parse(hour);

    if (iHour < 5) {
      iData -= 1;
    }

    var url = 'https://$domain:80/api/daily/$iData/${latlong.x}/${latlong.y}';

    final response = await client.get(Uri.parse(url), headers: headers);
    if (response.statusCode != 200) {
      throw Exception('error api');
    }

    var daily = jsonDecode(response.body);

    return Daily.fromJson(daily);
  }

  Future<SunModel> fetchSun(String legalcode, String baseData) async {
    var url = 'https://$domain:80/api/sun/$baseData/$legalcode';
    final response = await client.get(Uri.parse(url), headers: headers);
    if (response.statusCode != 200) {
      throw Exception('error api');
    }

    final getXml = response.body;
    final conventData = Xml2Json()..parse(getXml);
    final jsonData = conventData.toParker();
    var sun = jsonDecode(jsonData);

    return SunModel.fromJson(sun);
  }

  Future<DustModel> fetchDust(String legalcode) async {
    var url = 'https://$domain:80/api/dust/$legalcode';
    final response = await client.get(Uri.parse(url), headers: headers);
    if (response.statusCode != 200) {
      throw Exception('error api');
    }

    var dust = jsonDecode(response.body);

    return DustModel.fromJson(dust);
  }

  Future<GeoModel> fetchGeocoding(double lat, double long) async {
    var url = 'https://$domain:80/api/geo/$lat/$long';

    final response = await client.get(Uri.parse(url), headers: headers);
    if (response.statusCode != 200) {
      throw Exception('error api');
    }

    var geo = jsonDecode(response.body);

    return GeoModel.fromJson(geo);
  }
}
