import 'dart:convert';

import 'package:flutter_app_icons/flutter_app_icons.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:includenew/apis/userwallet.dart';

import '../constants.dart';

class LoginController extends GetxController {
  //
  RxString errorMessage = ''.obs;

  Map serverResponse = {};
  RxString recoverykeys = "".obs;
  Map loginData = {};

  String phonee = '';
  String emailee = '';

  final usercontroller = Get.put(UserWallet());

  final _flutterAppIconsPlugin = FlutterAppIcons();

  Future<bool> login({
    phone,
    password,
  }) async {
    phonee = phone;
    errorMessage.value = '';
    // ignore: unused_local_variable

    var data = jsonEncode({"phone": phone, "password": password});

    // return false;

    // Constants.logger.d("loging in");

    Constants.logger.d(data);

    // Constants.logger.d("test");
    try {
      final response = await http.post(
        Uri.parse("${Constants.baseUrl}user_auth/login"),
        headers: {
          "accept": "application/json",
          "Content-Type": "application/json"
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

        if (resData['validationErrors']['phone'] ==
            "Phone number must be a valid number : +234(10 digits)") {
          errorMessage.value = "Invalid phone number";
        }

        return false;
      } else {
        await Constants.store.write(
            'googleAuth', resData['data']['user']['settings']['google_two_fa']);
        await Constants.store.write('KYCDATA', resData['data']['user']['kyc']);
        await Constants.store
            .write('TOKEN', resData['data']['token']['access_token']);
        await Constants.store.write('LOGININFO', resData['data']);

        // Constants.store.read('LOGININFO')['user']['_id']
        if (resData['data']['user']['kyc'] != null) {
          await Constants.store.write("KYCSUBMITTED", true);
          await Constants.store
              .write("KYCDATA", resData['data']['user']['kyc']);
        }

        loginData = resData;

        // return true;
        return await usercontroller.getUserWallet();

        //  true;
      }
    } catch (error) {
      Constants.logger.d(error);
      return false;
    }
  }

  Future<bool> register({
    firstname,
    lastname,
    phone,
    password,
    pin,
    email,
  }) async {
    phonee = phone;
    emailee = email;
    errorMessage.value = '';
    // ignore: unused_local_variable

    var data = jsonEncode({
      "firstname": firstname,
      "lastname": lastname,
      "password": password,
      "phone": phone,
      "email": email,
      // "pin": pin,
    });

    // return false;

    Constants.logger.d(data);
    try {
      final response = await http.post(
        Uri.parse("${Constants.baseUrl}user_auth/register"),
        headers: {
          "accept": "application/json",
          "Content-Type": "application/json"
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
        // await Constants.store.write('ACCOUNTINFO', resData['data']);

        serverResponse = resData;

        // return await getDesign();
        return true;
      }
    } catch (error) {
      Constants.logger.d(error);

      return false;
    }
  }

  Future<bool> requestverification({
    field,
  }) async {
    errorMessage.value = '';
    // ignore: unused_local_variable

    var data = jsonEncode({
      if (field == "phone") "phone": phonee,
      if (field == "email") "email": emailee,
      "field": field, //phone, email
    });

    // return false;

    Constants.logger.d(data);
    try {
      final response = await http.post(
        Uri.parse("${Constants.baseUrl}user_auth/request"),
        headers: {
          "accept": "application/json",
          "Content-Type": "application/json"
        },
        body: data,
      );
      var resData = jsonDecode(response.body);

      Constants.logger.d(resData);
      if (response.statusCode != 200) {
        errorMessage.value = resData['message'];
        Fluttertoast.showToast(
            msg: resData['message'],
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            // backgroundColor: Colors.red,
            // textColor: Colors.white,
            fontSize: 14.0);
        return false;
      } else {
        Fluttertoast.showToast(
            msg: resData['message'],
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            // backgroundColor: Colors.red,
            // textColor: Colors.white,
            fontSize: 14.0);

        serverResponse = resData;

        return true;
      }
    } catch (error) {
      Constants.logger.d(error);

      return false;
    }
  }

  Future<bool> verify({code, field}) async {
    errorMessage.value = '';
    // ignore: unused_local_variable

    var data = jsonEncode({
      "code": code,
      if (field == "phone") "phone": phonee,
      if (field == "email") "email": emailee,
      "field": field
    }); //email phone

    // return false;

    Constants.logger.d(data);
    try {
      final response = await http.post(
        Uri.parse("${Constants.baseUrl}user_auth/verify"),
        headers: {
          "accept": "application/json",
          "Content-Type": "application/json"
        },
        body: data,
      );
      var resData = jsonDecode(response.body);

      Constants.logger.d(resData);
      if (response.statusCode != 200) {
        errorMessage.value = resData['message'];
        Fluttertoast.showToast(
            msg: resData['message'],
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            // backgroundColor: Colors.red,
            // textColor: Colors.white,
            fontSize: 14.0);
        return false;
      } else {
        // await Constants.store.write('ACCOUNTINFO', resData['data']);

        serverResponse = resData;

        return true;
      }
    } catch (error) {
      Constants.logger.d(error);

      return false;
    }
  }

  Future<bool> verifyall({phoncode, emailcode}) async {
    errorMessage.value = '';
    // ignore: unused_local_variable

    var data = jsonEncode({
      "phone_code": phoncode,
      "phone": phonee,
      "email": emailee,
      "email_code": emailcode
    }); //email phone

    // return false;

    Constants.logger.d(data);
    try {
      final response = await http.post(
        Uri.parse("${Constants.baseUrl}user_auth/verify-all"),
        headers: {
          "accept": "application/json",
          "Content-Type": "application/json"
        },
        body: data,
      );
      var resData = jsonDecode(response.body);

      Constants.logger.d(resData);
      if (response.statusCode != 200) {
        errorMessage.value = resData['message'];
        Fluttertoast.showToast(
            msg: resData['message'],
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            // backgroundColor: Colors.red,
            // textColor: Colors.white,
            fontSize: 14.0);
        return false;
      } else {
        // await Constants.store.write('ACCOUNTINFO', resData['data']);
        Fluttertoast.showToast(
            msg: "Please Login",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            // backgroundColor: Colors.red,
            // textColor: Colors.white,
            fontSize: 14.0);
        serverResponse = resData;

        return true;
      }
    } catch (error) {
      Constants.logger.d(error);

      return false;
    }
  }

  Future<bool> getDesign() async {
    errorMessage.value = '';

    try {
      final response = await http.get(
        Uri.parse("${Constants.baseUrl}user_auth/design_scheme"),
        headers: {
          "accept": "application/json",
          "Content-Type": "application/json"
        },
        // body: data,
      );
      var resData = jsonDecode(response.body);

      // if (resData.containsKey('msg')) {
      //   errorMessage.value = resData['msg'];
      // }

      Constants.logger.d(resData);
      // print("$resData");
      if (response.statusCode != 200) {
        errorMessage.value = resData['message'];

        return false;
      } else {
        await Constants.storeDesign.write('ACCOUNTDESIGN', resData['data']);

        serverResponse = resData;

        _flutterAppIconsPlugin.setIcon(
            icon: resData['data']['design']['app_logo'].toString());

        return true;
      }
    } catch (error) {
      Constants.logger.d(error);
      if (Constants.storeDesign.read('ACCOUNTDESIGN') != null) {
        return true;
      }
      return false;
    }
  }

  Future<bool> help({email, message}) async {
    errorMessage.value = '';
    // ignore: unused_local_variable

    var data = jsonEncode({"email": email, "message": message});

    // return false;

    // Constants.logger.d(data);
    try {
      final response = await http.post(
        Uri.parse("${Constants.baseUrl}help"),
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

  Future<bool> logout() async {
    errorMessage.value = '';
    // ignore: unused_local_variable

    // var data = jsonEncode({"phone": phone, "code": code});

    // return false;

    // Constants.logger.d(data);
    try {
      final response = await http.post(
        Uri.parse("${Constants.baseUrl}user_auth/logout"),
        headers: {
          "accept": "application/json",
          "Content-Type": "application/json",
          "authorization": "Bearer ${Constants.store.read('TOKEN')}",
        },
        // body: data,
      );
      var resData = jsonDecode(response.body);

      // if (resData.containsKey('msg')) {
      //   errorMessage.value = resData['msg'];
      // }

      Constants.logger.d(resData);
      if (response.statusCode != 200) {
        errorMessage.value = resData['message'];

        // Fluttertoast.showToast(
        //     msg: resData['message'],
        //     toastLength: Toast.LENGTH_LONG,
        //     gravity: ToastGravity.CENTER,
        //     timeInSecForIosWeb: 1,
        //     // backgroundColor: Colors.red,
        //     // textColor: Colors.white,
        //     fontSize: 14.0);

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

  Future<bool> start2fa() async {
    errorMessage.value = '';

    try {
      final response = await http.get(
        Uri.parse("${Constants.baseUrl}user_auth/2fa/start"),
        headers: {
          "accept": "application/json",
          "Content-Type": "application/json",
          "authorization": "Bearer ${Constants.store.read('TOKEN')}",
          "Cookie": Constants.store.read('COOKIE').toString(),
        },
        // body: data,
      );
      var resData = jsonDecode(response.body);

      // if (resData.containsKey('msg')) {
      //   errorMessage.value = resData['msg'];
      // }

      Constants.logger.d(resData);
      if (response.statusCode != 200) {
        errorMessage.value = resData['message'];
        Fluttertoast.showToast(
            msg: resData['message'],
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            // backgroundColor: Colors.red,
            // textColor: Colors.white,
            fontSize: 14.0);
        return false;
      } else {
        serverResponse = resData['data'];

        return true;
      }
    } catch (error) {
      Constants.logger.d(error);

      return false;
    }
  }

  Future<bool> enable2fa({code}) async {
    errorMessage.value = '';
    // ignore: unused_local_variable

    var data = jsonEncode({
      "code": code,
    });

    // return false;

    // Constants.logger.d(data);
    try {
      final response = await http.post(
        Uri.parse("${Constants.baseUrl}user_auth/2fa/enable"),
        headers: {
          "accept": "application/json",
          "Content-Type": "application/json",
          "authorization": "Bearer ${Constants.store.read('TOKEN')}",
          "Cookie": Constants.store.read('COOKIE').toString(),
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
        Fluttertoast.showToast(
            msg: resData['message'],
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            // backgroundColor: Colors.red,
            // textColor: Colors.white,
            fontSize: 14.0);
        return false;
      } else {
        recoverykeys.value = resData['data']['recovery_keys'].join();

        return true;
      }
    } catch (error) {
      Constants.logger.d(error);

      return false;
    }
  }

  Future<bool> verify2fa({code}) async {
    errorMessage.value = '';
    // ignore: unused_local_variable

    var data = jsonEncode({
      "code": code,
    });

    // return false;

    Constants.logger.d(data);
    try {
      final response = await http.post(
        Uri.parse("${Constants.baseUrl}user_auth/2fa/verify"),
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

      if (response.headers.containsKey('set-cookie')) {
        Constants.store.write('COOKIE', response.headers['set-cookie']!);
      }

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

  Future<bool> requestCode({phone}) async {
    phonee = phone;
    errorMessage.value = '';
    // ignore: unused_local_variable

    var data = jsonEncode({"phone": phone, "field": "phone"});

    // return false;

    // Constants.logger.d("loging in");

    Constants.logger.d(data);

    // Constants.logger.d("test");
    try {
      final response = await http.post(
        Uri.parse("${Constants.baseUrl}user_auth/request"),
        headers: {
          "accept": "application/json",
          "Content-Type": "application/json"
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
        // return true;
        return true;

        //  true;
      }
    } catch (error) {
      Constants.logger.d(error);

      return false;
    }
  }

  Future<bool> forgotpasswordverify({
    code,
  }) async {
    errorMessage.value = '';
    // ignore: unused_local_variable

    var data = jsonEncode({"phone": phonee, "code": code});

    // return false;

    Constants.logger.d(data);
    try {
      final response = await http.post(
        Uri.parse("${Constants.baseUrl}user_auth/forgot-password/verify"),
        headers: {
          "accept": "application/json",
          "Content-Type": "application/json"
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
        Fluttertoast.showToast(
            msg: resData['message'],
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            // backgroundColor: Colors.red,
            // textColor: Colors.white,
            fontSize: 14.0);
        return false;
      } else {
        await Constants.store.write('forgotpasswordverify', resData['data']);

        serverResponse = resData;

        return true;
      }
    } catch (error) {
      Constants.logger.d(error);

      return false;
    }
  }

  Future<bool> forgotpassword({
    password,
  }) async {
    errorMessage.value = '';
    // ignore: unused_local_variable

    var data = jsonEncode({"password": password});

    // return false;

    Constants.logger.d(data);
    try {
      final response = await http.post(
        Uri.parse("${Constants.baseUrl}user_auth/forgot-password"),
        headers: {
          "accept": "application/json",
          "Content-Type": "application/json",
          "authorization":
              "Bearer ${Constants.store.read('forgotpasswordverify')['token']['access_token']}",
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
        // Fluttertoast.showToast(
        //     msg: resData['message'],
        //     toastLength: Toast.LENGTH_LONG,
        //     gravity: ToastGravity.CENTER,
        //     timeInSecForIosWeb: 1,
        //     // backgroundColor: Colors.red,
        //     // textColor: Colors.white,
        //     fontSize: 14.0);
        return false;
      } else {
        // await Constants.store.write('resetpasswordverify', resData['data']);

        serverResponse = resData;

        return true;
      }
    } catch (error) {
      Constants.logger.d(error);

      return false;
    }
  }

  Future<bool> resetpassword({
    oldpassword,
    newpassword,
  }) async {
    errorMessage.value = '';
    // ignore: unused_local_variable

    var data =
        jsonEncode({"old_password": oldpassword, "new_password": newpassword});

    // return false;

    Constants.logger.d(data);
    try {
      final response = await http.post(
        Uri.parse("${Constants.baseUrl}user_auth/reset-password"),
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
        // await Constants.store.write('resetpasswordverify', resData['data']);

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
