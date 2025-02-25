import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';

class ViewEvidence extends StatelessWidget {
  String? url;
  ViewEvidence({super.key, this.url});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      child: Container(
        height: 450,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        decoration: BoxDecoration(
            color: const Color(0xfff6f6f6),
            borderRadius: BorderRadius.circular(14)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Text(
                  'Payment Evidence',
                  style: TextStyle(
                      color: Color(0xff1E3F52),
                      fontWeight: FontWeight.w700,
                      fontSize: 16),
                ),
                const Spacer(),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  decoration: BoxDecoration(
                    border: Border.all(color: const Color(0xff44CF95)),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: const Row(
                    children: [
                      Icon(
                        Feather.download,
                        color: Color(0xff44CF95),
                        size: 20,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Download',
                        style: TextStyle(
                            color: Color(0xff44CF95),
                            fontWeight: FontWeight.w400,
                            fontSize: 14),
                      ),
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'If this is a fake payment evidence from user,please report this user',
              style: TextStyle(
                  color: Color(0xff1E3F52),
                  fontWeight: FontWeight.w400,
                  fontSize: 14),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 250,
              child: CachedNetworkImage(
                imageUrl: url.toString(),
                fit: BoxFit.fill,
                errorWidget: (context, f, d) {
                  return const Center(child: Icon(Icons.info));
                },
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Spacer(),
            Row(
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  decoration: BoxDecoration(
                    border: Border.all(color: const Color(0xffE41D1D)),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: const Row(
                    children: [
                      Icon(
                        AntDesign.delete,
                        color: Color(0xffE41D1D),
                        size: 20,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Add to Junk',
                        style: TextStyle(
                            color: Color(0xffE41D1D),
                            fontWeight: FontWeight.w400,
                            fontSize: 14),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                const Text(
                  'Report',
                  style: TextStyle(
                      color: Color(0xffC11F1F),
                      fontWeight: FontWeight.w700,
                      fontSize: 14),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                    decoration: BoxDecoration(
                      color: const Color(0xff44CF95),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: const Text(
                      'Close',
                      style: TextStyle(
                          color: Color(0xfff6f6f6),
                          fontWeight: FontWeight.w400,
                          fontSize: 14),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
