import 'package:http/http.dart' as http;

class NetworkHelper {
  NetworkHelper(this.url);
  final Uri url;
  late final int _statusCode;

  Future fetchWeatherData() async {
    try {
      http.Response response = await http.get(url);
      _statusCode = response.statusCode;
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

  int getStatusCode() {
    return _statusCode;
  }
}
