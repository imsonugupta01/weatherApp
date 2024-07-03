<<<<<<< HEAD
# weather_app

A new Flutter project.

## Getting Started

# Weather App

A simple weather app using Flutter that displays current weather information for a given city. This app uses the OpenWeatherMap API to fetch weather data.

## Features

- Home screen with a search bar to enter a city name
- Weather details screen to display the weather information
- Display city name, current temperature (in Celsius), weather condition, an icon representing the weather condition, humidity percentage, and wind speed
- Proper error handling for API requests with user-friendly error messages
- Responsive design that works on both mobile and tablet devices
- Data persistence to save the last searched city

## Getting Started

### Prerequisites

- [Flutter](https://flutter.dev/docs/get-started/install) should be installed on your machine.
- An API key from [OpenWeatherMap](https://home.openweathermap.org/users/sign_up) (free registration).

### Installation

1. Clone the repository:
   git clone https://github.com/yourusername/weatherApp.git
   cd weatherApp
2.Install dependencies:
  flutter pub get

3.Configure the API key:

Open the weather_service.dart file located in the lib/services directory and replace YOUR_API_KEY with your actual OpenWeatherMap API key.

static const String _apiKey = 'YOUR_API_KEY';

4.Run the app:

flutter run
