import 'package:get/get.dart';

class TransactionsRecords {
  bool credit;
  String amount, timestamp, ref, description, id;
  String rawtime;
  String? currency;
  String? walletid, user, verificationCode;

  TransactionsRecords({
    required this.credit,
    required this.amount,
    required this.timestamp,
    required this.ref,
    required this.description,
    required this.rawtime,
    required this.id,
    this.currency,
    this.walletid,
    this.user,
    this.verificationCode,
  });
}

RxList<TransactionsRecords> transactionsRecords = <TransactionsRecords>[].obs;
