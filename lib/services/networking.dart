import 'package:http/http.dart' as http;

class NetworkHelper {
  NetworkHelper(this.url);
  final Uri url;

  Future fetchWeatherData() async {
    try {
      http.Response response = await http.get(url);
      if (response.statusCode == 200) {
        var data = response.body;
        return data;
      } else {
        return "Failed to load weather data, status code: ${response.statusCode}";
      }
    } catch (e) {
      print("There is an error occured$e");
    }
  }
}
