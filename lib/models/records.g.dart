// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'records.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Records _$RecordsFromJson(Map<String, dynamic> json) => Records(
      amount: (json['amount'] as num).toDouble(),
      type: json['type'] as String,
      description: json['description'] as String,
      ref: json['ref'] as String,
      isCompleted: json['isCompleted'] as bool,
      txnfee: (json['txnfee'] as num?)?.toDouble(),
      asset: json['asset'] as String?,
      currencysymbol: json['currencysymbol'] as String?,
      assetcategory: json['assetcategory'] as String?,
      category: json['category'] as String?,
      channel: json['channel'] as String?,
      createdat: json['createdat'] as String?,
      destination: json['destination'] as String?,
      role: json['role'] as String?,
      source: json['source'] as String?,
      usdtamount: (json['usdtamount'] as num?)?.toDouble(),
      userid: json['userid'] as String?,
      wallet: json['wallet'] as String?,
      walletcategory: json['walletcategory'] as String?,
      rate: (json['rate'] as num?)?.toDouble(),
      id: json['id'] as String?,
    );

Map<String, dynamic> _$RecordsToJson(Records instance) => <String, dynamic>{
      'description': instance.description,
      'ref': instance.ref,
      'type': instance.type,
      'channel': instance.channel,
      'id': instance.id,
      'asset': instance.asset,
      'assetcategory': instance.assetcategory,
      'currencysymbol': instance.currencysymbol,
      'destination': instance.destination,
      'category': instance.category,
      'source': instance.source,
      'createdat': instance.createdat,
      'role': instance.role,
      'userid': instance.userid,
      'wallet': instance.wallet,
      'walletcategory': instance.walletcategory,
      'amount': instance.amount,
      'txnfee': instance.txnfee,
      'usdtamount': instance.usdtamount,
      'rate': instance.rate,
      'isCompleted': instance.isCompleted,
    };
