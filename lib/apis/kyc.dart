import 'dart:convert';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../constants.dart';

class KycAPI extends GetxController {
  //
  RxString errorMessage = ''.obs;

  Map serverResponse = {};

  RxMap teansactionResponse = {}.obs;

  Future<bool> startkyc({email}) async {
    errorMessage.value = '';
    // ignore: unused_local_variable

    var data = jsonEncode({"email": email});

    Constants.logger.d(data);

    try {
      final response = await http.post(
        Uri.parse("${Constants.baseUrl}kyc/start"),
        headers: {
          "accept": "*/*",
          "Content-Type": "application/json",
          "authorization": "Bearer ${Constants.store.read('TOKEN')}",
        },
        body: data,
      );
      var resData = jsonDecode(response.body);

      Constants.logger.d(resData);
      if (response.statusCode != 200) {
        errorMessage.value = resData['message'];

        return false;
      } else {
        serverResponse = resData;

        await Constants.store.write("KYCDATA", resData);
        await Constants.store.write("KYCSUBMITTED", true);

        return true;
      }
    } catch (error) {
      Constants.logger.d(error);

      return false;
    }
  }

  Future<bool> getkycstatus() async {
    errorMessage.value = '';
    // ignore: unused_local_variable

    // var data = jsonEncode();

    // Constants.logger.d(data);

    try {
      final response = await http.get(
        Uri.parse("${Constants.baseUrl}kyc/status"),
        headers: {
          "accept": "*/*",
          "Content-Type": "application/json",
          "authorization": "Bearer ${Constants.store.read('TOKEN')}",
        },
        // body: data,
      );
      var resData = jsonDecode(response.body);

      Constants.logger.d(resData);
      if (response.statusCode != 200) {
        errorMessage.value = resData['message'];

        Fluttertoast.showToast(
            msg: resData['message'],
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            // backgroundColor: Colors.red,
            // textColor: Colors.white,
            fontSize: 14.0);
        return false;
      } else {
        serverResponse = resData;

        Fluttertoast.showToast(
            msg: resData['status'],
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            // backgroundColor: Colors.red,
            // textColor: Colors.white,
            fontSize: 14.0);

        await Constants.store.write('KYCDATA', resData);

        return true;
      }
    } catch (error) {
      Constants.logger.d(error);

      return false;
    }
  }

  // Future<bool> allTransaction() async {
  //   errorMessage.value = '';
  //   // ignore: unused_local_variable

  //   try {
  //     final response = await http.get(
  //       Uri.parse("${Constants.baseUrl}transactions/"),
  //       headers: {
  //         // "accept": "application/json",
  //         // "Content-Type": "application/json",
  //         "authorization": "Bearer ${Constants.store.read('TOKEN')}",
  //       },
  //     );
  //     var resData = jsonDecode(response.body);

  //     Constants.logger.d("allTransaction");
  //     Constants.logger.d(resData);

  //     if (response.statusCode != 200) {
  //       errorMessage.value = resData['message'];

  //       return false;
  //     } else {
  //       teansactionResponse.value = resData['data'];

  //       return true;
  //     }
  //   } catch (error) {
  //     Constants.logger.d(error);

  //     return false;
  //   }
  // }

  @override
  void onInit() {
    //
    super.onInit();
  }

  @override
  void onReady() {
    //
    super.onReady();
  }

  @override
  void onClose() {
    //
    super.onClose();
  }
}
