import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/weather.dart';
import '../services/weather_service.dart';

class WeatherProvider extends ChangeNotifier {
  Weather? _weather;
  bool _loading = false;
  String _error = '';

  Weather? get weather => _weather;
  bool get loading => _loading;
  String get error => _error;

  WeatherProvider() {
    _loadLastCity();
  }

  Future<void> fetchWeather(String city) async {
    _loading = true;
    _error = '';
    notifyListeners();

    try {
      final data = await WeatherService().fetchWeather(city);
      _weather = Weather.fromJson(data);
      await _saveLastCity(city);
    } catch (e) {
      _error = 'Could not fetch weather data';
    }

    _loading = false;
    notifyListeners();
  }

  Future<void> _loadLastCity() async {
    final prefs = await SharedPreferences.getInstance();
    final lastCity = prefs.getString('lastCity');
    if (lastCity != null) {
      fetchWeather(lastCity);
    }
  }

  Future<void> _saveLastCity(String city) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('lastCity', city);
  }
}
