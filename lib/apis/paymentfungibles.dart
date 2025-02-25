import 'dart:convert';

import 'package:get/get.dart';

import 'package:http/http.dart' as http;

import '../constants.dart';

class PaymentFungibles extends GetxController {
  //
  RxString errorMessage = ''.obs;

  Map serverResponse = {};

  Future<bool> initiateTxn({
    recipient,
    amount,
    currency,
    description,
    type,
    condition,
    expires,
  }) async {
    errorMessage.value = '';
    // ignore: unused_local_variable

// {
//     "reciepient": "6521e6fda71b200910979acc",
//     "amount": "5000",
//     "description": "Description is required",
//     "currency": "NGN",
//     "type": "fungible",
//     "condition": "+234", // phone number of the recipient
//     "expires": 60 // when the money reverses to the senders main wallet in seconds
// }

    var data = jsonEncode({
      "reciepient": recipient,
      "amount": amount,
      "description": description,
      "currency": currency,
      "type": type,
      "condition": condition, // phone number of the recipient
      "expires":
          expires // when the money reverses to the senders main wallet in seconds
    });

    // return false;

    Constants.logger.d(data);
    try {
      final response = await http.post(
        Uri.parse("${Constants.baseUrl}payment/fungibles/transfer"),
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

  Future<bool> retrieve({
    txnid,
    phone,
  }) async {
    errorMessage.value = '';
    // ignore: unused_local_variable

    // {
    // "transaction_id": "{{transaction_id}}",
    // "code": "849056"
    // }
    // 1. Check if the phon enumber matches the transaction
    // 2. If the phone number matches, fetch the childs wallet of the reciever
    // 3. Call function to buy utility on behalf of the reciever
    // 4.

    var data = jsonEncode({"transaction_id": txnid, "phone": phone});

    // return false;

    Constants.logger.d(data);
    try {
      final response = await http.post(
        Uri.parse("${Constants.baseUrl}payment/fungibles/verify"),
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
