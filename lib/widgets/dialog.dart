import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';

class SuccessfulDialogs extends StatelessWidget {
  bool showclose;
  String title;
  String description;
  bool showloader;
  Color loaderColor;

  SuccessfulDialogs({
    super.key,
    this.showclose = false,
    this.showloader = true,
    this.title = '',
    this.description = '',
    this.loaderColor = const Color(0xffB2B1B1),
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: const Color(0xfff6f6f6),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 24),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (showclose)
                const Icon(
                  MaterialCommunityIcons.close_box_outline,
                  size: 30,
                  color: Color(0xfff6f6f6),
                ),
              if (showclose) const Spacer(),
              Container(
                padding: const EdgeInsets.all(15),
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Color(0xffDBF1DA)),
                child: const Icon(Feather.check,
                    color: Color(0xff22B02E), size: 30),
              ),
              if (showclose) const Spacer(),
              if (showclose)
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: const Icon(
                    MaterialCommunityIcons.close_box_outline,
                    size: 30,
                  ),
                ),
            ],
          ),
          const SizedBox(
            height: 20.0,
          ),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Color(0xff2C333F),
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          Text(
            description,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Color(0xff646C79),
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          SizedBox(
            width: 116,
            child: showloader
                ? LinearProgressIndicator(
                    color: loaderColor,
                    backgroundColor: const Color(0xffE7E6E6),
                  )
                : const SizedBox(),
          ),
        ]),
      ),
    );
  }
}
