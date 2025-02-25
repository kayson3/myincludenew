import 'package:get/get.dart';
import 'package:includenew/oldscreendata/savings/fundsavings.dart';
import 'package:includenew/oldscreendata/savings/newsavings.dart';
import 'package:includenew/oldscreendata/savings/savingsdetail.dart';

class Newsavingwidgetcontroller extends GetxController {
  final RxInt step = 1.obs;
  NewSavings? newSavings;
  SavingDetail? savingDetail;
  FundSavings? fundSavings;
}
