import 'package:get/get.dart';
import 'package:includenew/models/records.dart';
import 'package:json_annotation/json_annotation.dart';

// import 'package:build_runner/build_runner.dart';
// import 'package:json_serializable/json_serializable.dart';

part 'savings.g.dart';

@JsonSerializable()
class SavingsClass {
  String? name,
      withdrawalInterval,
      profitpayoutInterval,
      id,
      image,
      returnn,
      createdat,
      createdatPlan,
      penalty,
      deletedat,
      planid,
      updatedat,
      durationInDays,
      thissavingsinterval,
      nextwithdrawaldate,
      asset,
      userid,
      description,
      maturitydate;
  double? quantity;
  double? price;

  bool? toggle;

  double? v, vplan, balance, principal, amounttosave;

  bool? isActive,
      isDeleted,
      autoSave,
      strictAutoSave,
      autoSavePlan,
      isActivePlan,
      isclosed,
      openforwithdrawal;

  List? savingsInterval;
  List<Records>? history;
  List? colors;

  SavingsClass(
      {required this.name,
      this.price,
      this.quantity,
      this.image,
      this.toggle,
      this.returnn,
      this.history,
      this.nextwithdrawaldate,
      this.autoSave,
      this.createdat,
      this.deletedat,
      this.updatedat,
      this.id,
      this.profitpayoutInterval,
      this.isActive,
      this.isDeleted,
      this.savingsInterval,
      this.strictAutoSave,
      this.v,
      this.planid,
      this.vplan,
      this.balance,
      this.principal,
      this.durationInDays,
      this.autoSavePlan,
      this.isActivePlan,
      this.createdatPlan,
      this.amounttosave,
      this.isclosed,
      this.openforwithdrawal,
      this.asset,
      this.maturitydate,
      this.thissavingsinterval,
      this.userid,
      this.colors,
      this.penalty,
      this.description,
      this.withdrawalInterval});

  factory SavingsClass.fromJson(Map<String, dynamic> json) =>
      _$SavingsClassFromJson(json);

  Map<String, dynamic> toJson() => _$SavingsClassToJson(this);
}

RxList<SavingsClass> mySavings = <SavingsClass>[
  SavingsClass(
      image: 'assets/images/drop.png',
      name: 'Silver',
      price: 0.00,
      description:
          'Auto Save  5% interest per annum. Withdraw available every 3 months. ',
      balance: 0,
      quantity: 0.00,
      toggle: false,
      isActive: false,
      thissavingsinterval: 'Daily',
      returnn: '5',
      savingsInterval: ['weekly', 'daily', 'monthly'],
      colors: ["4283714784", "4288311281"],
      id: "63a9f2f53cfad66efecf6ab9"),
  SavingsClass(
      image: 'assets/images/drop.png',
      name: 'Gold',
      price: 0.00,
      balance: 0,
      quantity: 0.00,
      toggle: false,
      description:
          'Auto Save  5% interest per annum. Withdraw available every 3 months. ',
      thissavingsinterval: 'Daily',
      colors: ["4283714784", "4288311281"],
      isActive: false,
      returnn: '3',
      savingsInterval: ['weekly', 'daily', 'monthly'],
      id: '',
      history: [
        // NotificationModel(
        //     amount: 13342,
        //     currency: 'USDT',
        //     date: '09 Jun 2022',
        //     description: 'Salary for month of June',
        //     email: 'mail.acishalres@gmail.com',
        //     isIn: true,
        //     read: true,
        //     time: '12:35',
        //     transactionType: 'Buy listing'),
      ]),
  SavingsClass(
    image: 'assets/images/drop.png',
    name: 'Target savings',
    description:
        'Auto Save  5% interest per annum. Withdraw available every 3 months. ',
    price: 0.00,
    quantity: 0.00,
    balance: 0,
    thissavingsinterval: 'Weekly',
    colors: ["4283714784", "4288311281"],
    returnn: '5',
    isActive: false,
    savingsInterval: ['weekly', 'daily', 'monthly'],
    id: '',
    toggle: false,
  ),
  SavingsClass(
    image: 'assets/images/drop.png',
    name: 'Hajj',
    price: 0.00,
    quantity: 0.00,
    balance: 0,
    colors: ["4283714784", "4288311281"],
    thissavingsinterval: 'Weekly',
    description:
        'Auto Save  5% interest per annum. Withdraw available every 3 months. ',
    returnn: '0',
    isActive: false,
    id: '',
    savingsInterval: ['weekly', 'daily', 'monthly'],
    toggle: false,
  ),
].obs;

RxList<SavingsClass> allSavings = <SavingsClass>[
  //since it shouldn't load

  SavingsClass(
      image: 'assets/images/drop.png',
      name: 'Silver',
      price: 0.00,
      quantity: 0.00,
      colors: ["4283714784", "4288311281"],
      toggle: false,
      returnn: '5%',
      description:
          'Auto Save  5% interest per annum. Withdraw available every 3 months. ',
      id: "63a9f2f53cfad66efecf6ab9",
      withdrawalInterval: 'every 3 months',
      savingsInterval: [
        'daily',
        'weekly',
        'monthly',
      ]),
  SavingsClass(
      image: 'assets/images/drop.png',
      name: 'Hajj',
      price: 0.00,
      quantity: 0.00,
      description:
          'Auto Save  5% interest per annum. Withdraw available every 3 months. ',
      toggle: false,
      colors: ["4283714784", "4288311281"],
      returnn: '5%',
      id: "63a9f2f53cfad66efecf6ab9",
      withdrawalInterval: 'every 3 months',
      savingsInterval: [
        'daily',
        'weekly',
        'monthly',
      ]),
  SavingsClass(
      image: 'assets/images/drop.png',
      name: 'Gold',
      price: 0.00,
      quantity: 0.00,
      toggle: false,
      returnn: '3',
      description:
          'Auto Save  5% interest per annum. Withdraw available every 3 months. ',
      id: '',
      colors: ["4283714784", "4288311281"],
      withdrawalInterval: 'every 3 months',
      savingsInterval: [
        'daily',
        'weekly',
        'monthly',
      ],
      history: [
        // NotificationModel(
        //     amount: 13342,
        //     currency: 'USDT',
        //     date: '09 Jun 2022',
        //     description: 'Salary for month of June',
        //     email: 'mail.acishalres@gmail.com',
        //     isIn: true,
        //     read: true,
        //     time: '12:35',
        //     transactionType: 'Buy listing'),
      ]),
  SavingsClass(
      image: 'assets/images/drop.png',
      name: 'Target savings',
      description:
          'Auto Save  5% interest per annum. Withdraw available every 3 months. ',
      price: 0.00,
      quantity: 0.00,
      returnn: '5',
      colors: ["4283714784", "4288311281"],
      withdrawalInterval: 'every 3 months',
      savingsInterval: [
        'daily',
        'weekly',
        'monthly',
      ],
      id: '',
      toggle: false),
].obs;

RxList<Records> savingshistory = <Records>[].obs;
