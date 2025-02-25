import 'dart:convert';

import 'package:get/get.dart';

import 'package:http/http.dart' as http;

import '../constants.dart';

class PaymentDirect extends GetxController {
  //
  RxString errorMessage = ''.obs;

  Map serverResponse = {};

  Future<bool> initiateTxn({
    recipient,
    amount,
    currency,
    description,
    type,
  }) async {
    errorMessage.value = '';
    // ignore: unused_local_variable

    // {
    // "reciepient": "6521e6fda71b200910979acc",
    // "amount": "1000",
    // "currency": "NGN",
    // "description": "Description is required",
    // "type": "direct"
    // }

    var data = jsonEncode({
      "reciepient": recipient,
      "amount": amount,
      "currency": currency,
      "description": description,
      "type": type
    });

    // return false;

    Constants.logger.d(data);
    try {
      final response = await http.post(
        Uri.parse("${Constants.baseUrl}payment/direct/transfer"),
        headers: {
          // "accept": "application/json",
          // "Content-Type": "application/json",
          "authorization": "Bearer ${Constants.store.read('TOKEN')}",
        },
        body: data,
      );
      var resData = jsonDecode(response.body);

      // if (resData.containsKey('msg')) {
      //   errorMessage.value = resData['msg'];
      // }

      Constants.logger.d(resData);
      if (response.statusCode != 200) {
        errorMessage.value = resData['message'];

        return false;
      } else {
        serverResponse = resData;

        return true;
      }
    } catch (error) {
      Constants.logger.d(error);

      return false;
    }
  }

  Future<bool> verifyTxn({
    txnid,
    code,
  }) async {
    errorMessage.value = '';
    // ignore: unused_local_variable

    // {
    // "transaction_id": "{{transaction_id}}",
    // "code": "849056"
    // }

    var data = jsonEncode({"transaction_id": txnid, "code": code});

    // return false;

    Constants.logger.d(data);
    try {
      final response = await http.post(
        Uri.parse("${Constants.baseUrl}payment/direct/transfer/verify"),
        headers: {
          "accept": "application/json",
          "Content-Type": "application/json",
          "authorization": "Bearer ${Constants.store.read('TOKEN')}",
        },
        body: data,
      );
      var resData = jsonDecode(response.body);

      // if (resData.containsKey('msg')) {
      //   errorMessage.value = resData['msg'];
      // }

      Constants.logger.d(resData);
      if (response.statusCode != 200) {
        errorMessage.value = resData['message'];

        return false;
      } else {
        serverResponse = resData;

        return true;
      }
    } catch (error) {
      Constants.logger.d(error);

      return false;
    }
  }

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
