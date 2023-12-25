import 'package:http/http.dart';

Future getData(url) async {
  Response response = await get(Uri.parse('http://192.168.1.128:8000/api'));
  return response.body;
}
