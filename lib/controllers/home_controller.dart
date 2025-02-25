import 'package:get/get.dart';
// import 'package:get/get_state_manager/get_state_manager.dart';

enum BottomTab {
  home,
  wallet,
  transactions,
  payment,
  transfer,
  paymentHome,
  records
}

class HomeController extends GetxController {
  RxBool isOnline = false.obs;

  RxBool paymentScreen = true.obs;

  RxBool acceptall = false.obs;
  Rx<BottomTab> selectedTab = BottomTab.payment.obs;
}
