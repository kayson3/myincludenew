import 'package:get/get.dart';

class PaymentTrans {
  String? txnRef;
  double? fee;
  double? amount;
  String? currency;
  String? type;
  String? sendername;
  String? remark;
  String? date;
  WithdrawalDetails? withdrawalDetails;
  String? status;
  String? orderNo;
  String? bankref;
  String? amountPaid;
  String? sessionId;
  String? txndur;
  String? collectionid;

  PaymentTrans(
      {this.txnRef,
      this.fee,
      this.amount,
      this.currency,
      this.remark,
      this.sendername,
      this.type,
      this.date,
      this.status,
      this.bankref,
      this.amountPaid,
      this.sessionId,
      this.orderNo,
      this.txndur,
      this.collectionid,
      this.withdrawalDetails});

  PaymentTrans.fromJson(Map<String, dynamic> json) {
    txnRef = json['txn_ref'];
    fee = json['fee'];
    amount = json['amount'];
    type = json['type'];
    currency = json['currency'];
    date = json['created_at'];
    status = json['status'];
    bankref = json['bankref'];
    orderNo = json['orderNo'];
    amountPaid = json['amountPaid'];
    sessionId = json['sessionId'];
    collectionid = json['collection_id'];
    txndur = json['txndur'];
    withdrawalDetails = json['withdrawal_details'] != null
        ? WithdrawalDetails.fromJson(json['withdrawal_details'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['txn_ref'] = txnRef;
    data['fee'] = fee;
    data['amount'] = amount;
    data['type'] = type;
    data['currency'] = currency;
    data['created_at'] = date;
    data['status'] = status;
    data['bankref'] = bankref;
    data['orderNo'] = orderNo;
    data['collection_id'] = collectionid;
    data['amountPaid'] = amountPaid;
    data['sessionId'] = sessionId;
    data['txndur'] = txndur;
    if (withdrawalDetails != null) {
      data['withdrawal_details'] = withdrawalDetails!.toJson();
    }
    return data;
  }
}

class WithdrawalDetails {
  String? bankName;
  String? accountNumber;
  String? accountName;

  WithdrawalDetails({this.bankName, this.accountNumber, this.accountName});

  WithdrawalDetails.fromJson(Map<String, dynamic> json) {
    bankName = json['bank_name'];
    accountNumber = json['account_number'];
    accountName = json['account_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['bank_name'] = bankName;
    data['account_number'] = accountNumber;
    data['account_name'] = accountName;
    return data;
  }
}

RxList<PaymentTrans> payOutTransactionList = <PaymentTrans>[].obs;
RxList<PaymentTrans> colllectionTransactionList = <PaymentTrans>[].obs;
