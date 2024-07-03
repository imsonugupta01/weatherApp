import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/weather_provider.dart';

class WeatherDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final weatherProvider = Provider.of<WeatherProvider>(context);
    final weather = weatherProvider.weather;

    return Scaffold(
      appBar: AppBar(
        title: Text(weather!.cityName),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              weatherProvider.fetchWeather(weather.cityName);
            },
          ),
        ],
      ),
      body: weatherProvider.loading
          ? Center(child: CircularProgressIndicator())
          : Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            // 'https://img.freepik.com/premium-vector/mountain-hill-landscape-with-cloud-blue-sky_24908-10364.jpg?size=626&ext=jpg', // Replace with your background image URL
            'lib/Images/images2.jpg',
            fit: BoxFit.cover,


          ),
          Container(
            color: Colors.black.withOpacity(0.5), // Add a semi-transparent overlay
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  weather.cityName,
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 16.0),
                Image.network(
                  'http:${weather.icon}',
                  width: 100,
                  height: 100,
                ),
                SizedBox(height: 16.0),
                Text(
                  '${weather.temperature}°C',
                  style: TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Text(
                  weather.condition,
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 16.0),
                Text(
                  'Humidity: ${weather.humidity}%',
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                  ),
                ),
                Text(
                  'Wind Speed: ${weather.windSpeed} kph',
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
