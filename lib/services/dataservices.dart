import 'dart:convert';

import 'package:get_login_firebase/models/medicine.dart';
import 'package:http/http.dart' as http;

class DataServices {
  //get url
  var url = "https://run.mocky.io/v3/f50bcc43-5a7f-4116-ad0e-4375078161b5";

  // create get function
  Future<Medicines?> getService() async {
    var response = await http.get(Uri.parse(url));
    // check condition
    if (response.statusCode == 200) {
      // json decode
      var data = json.decode(response.body) as List<dynamic>;
      //print(data);

      return Medicines.fromJson(data[0]);
    } else {
      return null;
    }
  }
}
