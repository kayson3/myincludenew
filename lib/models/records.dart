import 'package:get/get.dart';
import 'package:json_annotation/json_annotation.dart';
// import 'package:build_runner/build_runner.dart';
// import 'package:json_serializable/json_serializable.dart';

part 'records.g.dart';

@JsonSerializable()
class Records {
  String description;
  String ref;
  String type;
  String? channel,
      id,
      asset,
      assetcategory,
      currencysymbol,
      destination,
      category,
      source,
      createdat,
      role,
      userid,
      wallet,
      walletcategory;
  double amount;
  double? txnfee, usdtamount, rate;
  bool isCompleted;
  Map? metadata;

  Records(
      {required this.amount,
      required this.type,
      required this.description,
      required this.ref,
      required this.isCompleted,
      this.txnfee,
      this.asset,
      this.currencysymbol,
      this.assetcategory,
      this.category,
      this.channel,
      this.createdat,
      this.destination,
      this.role,
      this.source,
      this.usdtamount,
      this.userid,
      this.wallet,
      this.metadata,
      this.walletcategory,
      this.rate,
      this.id});

  factory Records.fromJson(Map<String, dynamic> json) =>
      _$RecordsFromJson(json);

  Map<String, dynamic> toJson() => _$RecordsToJson(this);
}

RxList<Records> recordList = <Records>[
  // Records(
  //   amount: 0.00,
  //   type: 'Debit',
  //   description: 'For Children School fees',
  //   ref: 'REF : 1234MT',
  //   isCompleted: false,
  // ),
  // Records(
  //   amount: 0.00,
  //   type: 'Debit',
  //   description: 'For Children School fees',
  //   ref: 'REF : 1234MT',
  //   isCompleted: true,
  // ),
  // Records(
  //   amount: 0.00,
  //   type: 'Credit',
  //   description: 'Paystack card funding',
  //   ref: 'REF : 1234MT',
  //   isCompleted: true,
  // ),
  // Records(
  //   amount: 0.00,
  //   type: 'Debit',
  //   description: 'For Children School fees',
  //   ref: 'REF : 1234MT',
  //   isCompleted: true,
  // ),
  // Records(
  //   amount: 0.00,
  //   type: 'Credit',
  //   description: 'Fuspay bonus',
  //   ref: 'REF : 1234MT',
  //   isCompleted: false,
  // )
].obs;

RxList<Records> recordListt = <Records>[
  // Records(
  //   amount: 0.00,
  //   type: 'Debit',
  //   description: 'For Children School fees',
  //   ref: 'REF : 1234MT',
  //   isCompleted: false,
  // ),
  // Records(
  //   amount: 0.00,
  //   type: 'Debit',
  //   description: 'For Children School fees',
  //   ref: 'REF : 1234MT',
  //   isCompleted: true,
  // ),
  // Records(
  //   amount: 0.00,
  //   type: 'Credit',
  //   description: 'Paystack card funding',
  //   ref: 'REF : 1234MT',
  //   isCompleted: true,
  // ),
  // Records(
  //   amount: 0.00,
  //   type: 'Debit',
  //   description: 'For Children School fees',
  //   ref: 'REF : 1234MT',
  //   isCompleted: true,
  // ),
  // Records(
  //   amount: 0.00,
  //   type: 'Credit',
  //   description: 'Fuspay bonus',
  //   ref: 'REF : 1234MT',
  //   isCompleted: false,
  // )
].obs;
