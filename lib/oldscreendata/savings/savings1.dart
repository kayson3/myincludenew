import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:includenew/models/savings.dart';
import 'package:includenew/oldscreendata/savings/createsavingcontroller.dart';
import 'package:includenew/oldscreendata/savings/newsavings.dart';
import 'package:includenew/oldscreendata/savings/savingsdetail.dart';
import 'package:includenew/widgets/shimmerloader.dart';
import 'package:shimmer/shimmer.dart';

enum SavingsType { Gold, Silver, Targetsavings, Hajj }

class Savings1 extends StatelessWidget {
  Savings1({
    super.key,
  });
  RxBool mySavingsLoaded = true.obs;

  final newsavingwidgetcontroller = Get.put(Newsavingwidgetcontroller());

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 1,
      child: SizedBox(
        height: 475,
        child: Column(
          children: [
            const SizedBox(height: 15),
            Expanded(
              child: TabBarView(
                children: [
                  // first tab bar view widget

                  SingleChildScrollView(
                    child: Obx(
                      () => Column(
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(top: 5.0, left: 15),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                'Your savings',
                                style: TextStyle(
                                  color: Color(0xff343131),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          SizedBox(
                            height: 170,
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20.0, vertical: 5),
                                  child: Obx(() => Row(
                                      children: mySavingsLoaded.value
                                          ? mySavings
                                              .map((e) => GestureDetector(
                                                    onTap: () {
                                                      newsavingwidgetcontroller
                                                              .savingDetail =
                                                          SavingDetail(
                                                        saving: e,
                                                      );

                                                      newsavingwidgetcontroller
                                                          .step.value = 3;
                                                      // if (e.isActive!) {
                                                      //   Get.to(
                                                      //       () => SavingDetail(
                                                      //             saving: e,
                                                      //           ),
                                                      //       transition:
                                                      //           Transition
                                                      //               .fadeIn);
                                                      // } else {
                                                      //   newsavingwidgetcontroller
                                                      //           .newSavings =
                                                      //       NewSavings(
                                                      //           type:
                                                      //               SavingsType
                                                      //                   .Silver,
                                                      //           savings: e);

                                                      //   step.value = 2;
                                                      // }
                                                    },
                                                    child: Container(
                                                      width: 108,
                                                      height: 140,
                                                      padding: const EdgeInsets
                                                          .symmetric(
                                                          horizontal: 10,
                                                          vertical: 5),
                                                      margin:
                                                          const EdgeInsets.only(
                                                              right: 10.0),
                                                      decoration: BoxDecoration(
                                                          // color:
                                                          //     const Color(0xffF0F0F0),
                                                          gradient: LinearGradient(
                                                              begin: Alignment
                                                                  .topCenter,
                                                              end: Alignment
                                                                  .bottomCenter,
                                                              colors: [
                                                                Color(int.parse(
                                                                    e.colors?[
                                                                        0])),
                                                                Color(
                                                                  int.parse(
                                                                      e.colors?[
                                                                          1]),
                                                                )
                                                              ]),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      18)),
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          const SizedBox(
                                                            height: 13,
                                                          ),
                                                          GestureDetector(
                                                            onTap: () {},
                                                            child: Text(
                                                              "${e.name![0].toUpperCase()}${e.name!.substring(1).toLowerCase()}",
                                                              style: const TextStyle(
                                                                  fontSize: 17,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700,
                                                                  color: Color(
                                                                      0xfff6f6f6)),
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                            height: 3,
                                                          ),

                                                          Text(
                                                            '${e.returnn!}% Profit',
                                                            style: const TextStyle(
                                                                fontSize: 12,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                color: Color(
                                                                    0xfff6f6f6)),
                                                          ),
                                                          const SizedBox(
                                                            height: 7,
                                                          ),
                                                          // Padding(
                                                          //   padding: const EdgeInsets
                                                          //           .symmetric(
                                                          //       horizontal: 8.0),
                                                          //   child: Image.asset(
                                                          //     e.image,
                                                          //     height: 50,
                                                          //     width: 50,
                                                          //   ),
                                                          // ),
                                                          const Spacer(),
                                                          const SizedBox(
                                                              height: 13),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .symmetric(
                                                                    horizontal:
                                                                        8.0),
                                                            child: Text(
                                                              r'$ '
                                                              '${e.price!.toStringAsFixed(2)}',
                                                              style: const TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                  fontSize:
                                                                      12.57,
                                                                  color: Color(
                                                                      0xfff6f6f6)),
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                              height: 2),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .symmetric(
                                                                    horizontal:
                                                                        8.0),
                                                            child: Row(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .end,
                                                              children: [
                                                                // Text(
                                                                //   '${NumberFormat.simpleCurrency(locale: Platform.localeName, name: allmyfiatList.value[0].country_currency ?? 'USD').currencySymbol}',
                                                                //   style: const TextStyle(
                                                                //       fontWeight:
                                                                //           FontWeight
                                                                //               .w400,
                                                                //       fontSize:
                                                                //           14,
                                                                //       color: Color(
                                                                //           0xfff6f6f6)),
                                                                // ),
                                                                Expanded(
                                                                  child: Text(
                                                                    e.balance!
                                                                        .toStringAsFixed(
                                                                            2),
                                                                    // overflow:
                                                                    //     TextOverflow
                                                                    //         .visible,
                                                                    style: const TextStyle(
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w400,
                                                                        fontSize:
                                                                            19,
                                                                        color: Color(
                                                                            0xfff6f6f6)),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          const Spacer(),
                                                        ],
                                                      ),
                                                    ),
                                                  ))
                                              .toList()
                                          : [
                                              ListView.separated(
                                                itemCount: 3,
                                                shrinkWrap: true,
                                                scrollDirection:
                                                    Axis.horizontal,
                                                itemBuilder: (context, index) {
                                                  return Shimmer.fromColors(
                                                    baseColor:
                                                        Colors.grey[300]!,
                                                    highlightColor:
                                                        Colors.white,
                                                    child: Container(
                                                      width: 118,
                                                      height: 185,
                                                      padding: const EdgeInsets
                                                          .symmetric(
                                                          horizontal: 10,
                                                          vertical: 5),
                                                      margin:
                                                          const EdgeInsets.only(
                                                              right: 10.0),
                                                      decoration: BoxDecoration(
                                                          color: Colors.grey,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      18)),
                                                      child: const Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                      ),
                                                    ),
                                                  );
                                                },
                                                separatorBuilder:
                                                    (context, index) {
                                                  return const SizedBox(
                                                    width: 0,
                                                  );
                                                },
                                              ),
                                            ]))),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top: 10.0, left: 15),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                'Savings Plans',
                                style: TextStyle(
                                  color: Color(0xff343131),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          if (allSavings.isNotEmpty) ...[
                            ...allSavings.map((element) {
                              return Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 25.0, vertical: 10),
                                child: GestureDetector(
                                  behavior: HitTestBehavior.opaque,
                                  onTap: () {
                                    SavingsClass elementt = mySavings
                                        .where((p0) => p0.name == element.name)
                                        .first;

                                    if (elementt.isActive!) {
                                      Get.to(
                                          () => SavingDetail(
                                                saving: elementt,
                                              ),
                                          transition: Transition.fadeIn);
                                    } else {
                                      newsavingwidgetcontroller.newSavings =
                                          NewSavings(
                                              type: SavingsType.Silver,
                                              savings: elementt);

                                      newsavingwidgetcontroller.step.value = 2;
                                    }
                                  },
                                  child: Row(
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.all(5.0),
                                        decoration: BoxDecoration(
                                            gradient: LinearGradient(
                                                begin: Alignment.topCenter,
                                                end: Alignment.bottomCenter,
                                                colors: [
                                                  Color(int.parse(
                                                      element.colors?[0])),
                                                  Color(int.parse(
                                                      element.colors?[1])),
                                                ]),
                                            shape: BoxShape.circle),
                                        child: const Padding(
                                          padding: EdgeInsets.only(
                                              right: 4.0, bottom: 3),
                                          child: Icon(
                                              FontAwesome5Solid.piggy_bank,
                                              size: 15,
                                              color: Color(0xfff6f6f6)),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "${element.name![0].toUpperCase()}${element.name!.substring(1).toLowerCase()}",
                                              style: const TextStyle(
                                                color: Color(0xff747474),
                                                fontSize: 12.3,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            RichText(
                                                text: TextSpan(
                                                    text: element.description!,
                                                    style: const TextStyle(
                                                        color:
                                                            Color(0xff343131),
                                                        fontSize: 10),
                                                    children: const []))
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            }),
                          ] else
                            ListView.separated(
                              itemCount: 3,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 25.0),
                                  child: GestureDetector(
                                    behavior: HitTestBehavior.opaque,
                                    // onTap: () => Get.bottomSheet(
                                    //     NewSavings(type: SavingsType.Silver),
                                    //     isScrollControlled: true),
                                    child: Row(
                                      children: [
                                        Shimmer.fromColors(
                                          baseColor: Colors.grey[300]!,
                                          highlightColor: Colors.white,
                                          child: Container(
                                            padding: const EdgeInsets.all(9.0),
                                            decoration: const BoxDecoration(
                                                gradient: LinearGradient(
                                                    begin: Alignment.topCenter,
                                                    end: Alignment.bottomCenter,
                                                    colors: [
                                                      Color(0xffB8B7B7),
                                                      Color(0xff888888),
                                                    ]),
                                                shape: BoxShape.circle),
                                            child: const Padding(
                                              padding: EdgeInsets.only(
                                                  right: 4.0, bottom: 3),
                                              child: Icon(
                                                  FontAwesome5Solid.piggy_bank,
                                                  color: Color(0xfff6f6f6)),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 20,
                                        ),
                                        const Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              ShimmerLoader(
                                                width: 30,
                                                height: 10,
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Column(
                                                children: [
                                                  ShimmerLoader(
                                                    width: double.infinity,
                                                    height: 10,
                                                  ),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  ShimmerLoader(
                                                    width: double.infinity,
                                                    height: 10,
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              },
                              separatorBuilder: (context, index) {
                                return const SizedBox(
                                  height: 30,
                                );
                              },
                            ),
                          const SizedBox(
                            height: 15,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
