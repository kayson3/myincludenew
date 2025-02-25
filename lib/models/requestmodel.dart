import 'package:get/get_rx/get_rx.dart';

class RequestModel {
  String? rate, amount, type, timeremaining, commission;

  RequestModel(
      {this.rate, this.amount, this.type, this.commission, this.timeremaining});
}

RxList<RequestModel> requestCardList = <RequestModel>[
  RequestModel(
      amount: '677',
      commission: '0.34',
      timeremaining: '10s',
      rate: 'N540,000.00 at 745.34 to USD',
      type: 'FUNDING'),
  // RequestModel(
  //     amount: '677',
  //     commission: '0.34',
  //     timeremaining: '10s',
  //     rate: 'N540,000.00 at 745.34 to USD',
  //     type: 'WITHDRAWAL'),
  // RequestModel(
  //     amount: '677',
  //     commission: '0.34',
  //     timeremaining: '0.1s',
  //     rate: 'N540,000.00 at 745.34 to USD',
  //     type: 'FUNDING'),
  // RequestModel(
  //     amount: '677',
  //     commission: '0.34',
  //     timeremaining: '10s',
  //     rate: 'N540,000.00 at 745.34 to USD',
  //     type: 'WITHDRAWAL'),
  // RequestModel(
  //     amount: '677',
  //     commission: '0.34',
  //     timeremaining: '10s',
  //     rate: 'N540,000.00 at 745.34 to USD',
  //     type: 'FUNDING'),
].obs;
