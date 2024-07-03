import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/weather_provider.dart';

class HomeScreen extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text('Weather App'))),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: _controller,
                decoration: InputDecoration(
                  labelText: 'Enter city name',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  final city = _controller.text;
                  if (city.isNotEmpty) {
                    Provider.of<WeatherProvider>(context, listen: false).fetchWeather(city);
                  }
                },
                child: Text('Get Weather'),
              ),
              SizedBox(height: 16.0),
              Consumer<WeatherProvider>(
                builder: (context, weatherProvider, child) {
                  if (weatherProvider.loading) {
                    return CircularProgressIndicator();
                  } else if (weatherProvider.weather != null) {
                    return ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/details');
                      },
                      child: Text('View Weather Details'),
                    );
                  } else if (weatherProvider.error.isNotEmpty) {
                    return Text(weatherProvider.error);
                  }
                  return Container();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}