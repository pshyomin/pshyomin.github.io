import 'dart:math';

import '/models/weather/daily_model.dart';
import '/models/weather/dust_model.dart';
import '/models/weather/geo_model.dart';
import '/models/weather/live_day_model.dart';
import '/models/weather/live_model.dart';
import '/models/weather/sun_model.dart';
import '/utils/weather/api_client_manager.dart';

class WeatherRepository {
  final APIClientManager apiClientManager;
  WeatherRepository({required this.apiClientManager});

  Future<Live> fetchLive(
      Point<num> latlong, String baseData, String hour, String minute) async {
    return await apiClientManager.fetchLive(latlong, baseData, hour, minute);
  }

  Future<LiveDayModel> fetchLiveDay(
      Point<num> latlong, String baseData, String hour, String minute) async {
    return await apiClientManager.fetchLiveDay(latlong, baseData, hour, minute);
  }

  Future<Daily> fetchDaily(
      Point<num> latlong, String baseData, String hour) async {
    return await apiClientManager.fetchDaily(latlong, baseData, hour);
  }

  Future<SunModel> fetchSun(String legalcode, String baseData) async {
    return await apiClientManager.fetchSun(legalcode, baseData);
  }

  Future<DustModel> fetchDust(String legalcode) async {
    return await apiClientManager.fetchDust(legalcode);
  }

  Future<GeoModel> fetchGeocoding(double lat, double long) async {
    return await apiClientManager.fetchGeocoding(lat, long);
  }
}
