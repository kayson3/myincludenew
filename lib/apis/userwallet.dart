import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:includenew/models/trsansactions.dart';
import 'package:intl/intl.dart';

import '../constants.dart';

class UserWallet extends GetxController {
  //
  RxString errorMessage = ''.obs;

  Map serverResponse = {};

  RxMap teansactionResponse = {}.obs;
  RxMap teansactionDResponse = {}.obs;

  Future<bool> getUserWallet() async {
    errorMessage.value = '';
    // ignore: unused_local_variable

    try {
      final response = await http.get(
        Uri.parse("${Constants.baseUrl}user/account"),
        headers: {
          // "accept": "application/json",
          // "Content-Type": "application/json",
          "authorization": "Bearer ${Constants.store.read('TOKEN')}",
        },
      );
      var resData = jsonDecode(response.body);

      Constants.logger.d(resData);
      if (response.statusCode != 200) {
        errorMessage.value = resData['message'];

        return false;
      } else {
        serverResponse = resData;

        Constants.store.write("USERWALLET", resData['data']);
        return true;
      }
    } catch (error) {
      Constants.logger.d(error);

      return false;
    }
  }

  Future<bool> allTransaction() async {
    errorMessage.value = '';
    // ignore: unused_local_variable

    try {
      final response = await http.get(
        Uri.parse("${Constants.baseUrl}transactions/"),
        headers: {
          // "accept": "application/json",
          // "Content-Type": "application/json",
          "authorization": "Bearer ${Constants.store.read('TOKEN')}",
        },
      );
      var resData = jsonDecode(response.body);

      Constants.logger.d("allTransaction");
      Constants.logger.d(resData);

      if (response.statusCode != 200) {
        errorMessage.value = resData['message'];

        return false;
      } else {
        teansactionResponse.value = resData['data'];

        for (var e in resData['data']['transactions']) {
          transactionsRecords.add(TransactionsRecords(
            id: e['_id'].toString(),
            amount: e['amount'].toString(),
            credit: e["type"] == "incoming" ? true : false,
            description: e['status'].toString(),
            ref: 'Ref: ${e['txn_reference']}',
            rawtime: e['created_at'],
            timestamp: DateFormat("EEE dd MMM yyyy hh:mm a")
                .format(DateTime.parse(e['created_at'].toString())),
            currency: e['currency'].toString(),
            walletid: e['wallet_id'].toString(),
            user: e['user'].toString(),
            verificationCode: e['verification_code'].toString(),
          ));
        }
        transactionsRecords.refresh();

        return true;
      }
    } catch (error) {
      Constants.logger.d(error);

      return false;
    }
  }

  Future<bool> transactiondetail({id}) async {
    errorMessage.value = '';
    // ignore: unused_local_variable

    try {
      final response = await http.get(
        Uri.parse("${Constants.baseUrl}transactions/$id"),
        headers: {
          // "accept": "application/json",
          // "Content-Type": "application/json",
          "authorization": "Bearer ${Constants.store.read('TOKEN')}",
        },
      );
      var resData = jsonDecode(response.body);

      Constants.logger.d("transactiondetail");
      Constants.logger.d(resData);

      if (response.statusCode != 200) {
        errorMessage.value = resData['message'];

        return false;
      } else {
        teansactionDResponse.value = resData['data'];

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
