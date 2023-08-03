import 'package:get/get.dart';

import '../models/medicine.dart';
import '../services/dataservices.dart';

class DataController extends GetxController {
  var loaing = true.obs;
  var medicine = Medicines().obs;

  getmedicine() async {
    try {
      //create instance of data service
      loaing.value = true;
      var data = await DataServices().getService();
      print(data);

      // check condition
      if (data != null) {
        medicine.value = data;
        loaing.value = false;
      }
    } catch (e) {
      // Get.snackbar("title", "$e");
      loaing.value = false;
    }
  }

  @override
  void onInit() {
    getmedicine();
    super.onInit();
  }
}
