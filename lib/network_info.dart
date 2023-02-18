import 'dart:convert';
import 'package:http/http.dart' as http;

void main() {
  getRequestTest();
}
Future<void> getRequestTest() async {
  Uri url = Uri.https("ifconfig.co", "json");
  http.Response response = await http.get(url);
  print(response.body);

  NetworkConfigResponse configResponse = NetworkConfigResponse.fromJson(json);
  print(configResponse._currentip);
  print(configResponse._ipAddress);
  print(configResponse._country);

}
class NetworkConfigResponse{
  late String _currentip;
  late String _ipAddress;
  late String _country;

  NetworkConfigResponse({
  required String currentip,
  required String ipAddress,
  required String country
})
{
  _currentip = currentip;
  _ipAddress = ipAddress;
  _country = country;
}

NetworkConfigResponse.fromJson(dynamic json){
_currentip = json['currentip'];
_ipAddress = json['ip'];
_country = json['country'];
}
}

