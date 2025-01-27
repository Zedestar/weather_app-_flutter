class WeatherModel {
  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return "⛈️"; // Thunderstorm
    } else if (condition < 400) {
      return "🌧️"; // Drizzle
    } else if (condition < 600) {
      return "☔"; // Rain
    } else if (condition < 700) {
      return "❄"; // Snow
    } else if (condition < 800) {
      return "☁️"; // Clouds
    } else if (condition == 800) {
      return "☀️"; // Clear sky
    } else if (condition <= 804) {
      return "☁️"; // Clouds (with different intensity)
    } else {
      return "☀️"; // Clear sky (default)
    }
  }

  String getMessage(double temp) {
    if (temp > 25) {
      return "It's 🍦 time!";
    } else if (temp > 20) {
      return "Time for shorts and 👕!";
    } else if (temp < 10) {
      return "You'll need 🧣 and 🧤!";
    } else {
      return "Bring a 🧥 just in case!";
    }
  }
}
