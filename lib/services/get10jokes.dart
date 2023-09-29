import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List<dynamic>> fetchJoke(String? myjoketype) async {
  Uri url;
  if (myjoketype == "random") {
    url = Uri.parse('https://official-joke-api.appspot.com/random_ten');
  } else {
    url = Uri.parse(
        'https://official-joke-api.appspot.com/jokes/$myjoketype/ten');
  }
  List<dynamic> list = [];

  try {
    final response = await http.get(url);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      if (data != null) {
        list = List<dynamic>.from(data);
      }
    }
  } catch (e) {
    //  print('There was an error: $e');
  }
  return list;
}
