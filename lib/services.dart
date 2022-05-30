import 'package:http/http.dart' as http;
import 'package:proofofconecpt/model.dart';

class Services {
  static var client = http.Client();

  // ignore: non_constant_identifier_names
  static Future<Poc> pocservices() async {
    Uri url = Uri.parse(
        "https://raw.githubusercontent.com/pravesh-razor/Own-API-s/main/proofofconcept.json");
    var response = await client.get(url);
    if (response.statusCode == 200) {
      var json = response.body;
      print(response.body);
      // debugPrint(json);
      return pocFromJson(json);
    } else {
      // ignore: avoid_print
      print("Fail To Load");
      throw Exception('Failed to load');
    }
  }
}
