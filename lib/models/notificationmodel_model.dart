import 'package:get/get.dart';

class Notificationmodel {
  int? notificationId;
  String? date;
  String? time;
  String? email;
  String? description;
  List? tags;
  bool? isRead;

  Notificationmodel(
      {this.notificationId,
      this.date,
      this.time,
      this.email,
      this.description,
      this.tags,
      this.isRead});

  Notificationmodel.fromJson(Map<String, dynamic> json) {
    notificationId = json['notification_id'];
    date = json['date'];
    time = json['time'];
    email = json['email'];
    description = json['description'];
    if (json['tags'] != null) {
      tags = [];
      json['tags'].forEach((v) {
        tags?.add(v);
      });
    }
    isRead = json['is_read'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['notification_id'] = notificationId;
    data['date'] = date;
    data['time'] = time;
    data['email'] = email;
    data['description'] = description;
    if (tags != null) {
      data['tags'] = tags?.map((v) => v).toList();
    }
    data['is_read'] = isRead;
    return data;
  }
}

RxList<Notificationmodel> notificationListList = <Notificationmodel>[].obs;
