import 'dart:convert';
import 'package:http/http.dart';

class AgifyService {
  String name;

  AgifyService({required this.name});

  Future<int> getAge() async {
    try {
      var uri = Uri.parse('https://api.agify.io?name=$name');
      Response response = await get(uri);
      // print(response.body);
      Map data = jsonDecode(response.body);
      int age = data['age'];

      return age;

    } catch (e) {
      print('error $e');
      return 0;
    }
  }
}
