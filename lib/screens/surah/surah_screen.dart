import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quran_app/controller/surah/All_surah_contoller.dart';
import 'package:quran_app/controller/surah/ayah_controller.dart';
import 'package:quran_app/screens/surah/ayah_screen.dart';
import 'package:quran_app/utils/style/text_style.dart';

import '../../utils/eng_to_arabic_number.dart';

class SurahScreen extends StatelessWidget {
  SurahScreen({super.key});
  //get controller
  final AllSurahController controller = Get.put(AllSurahController());
  final AyahController ayahController = Get.put(AyahController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 13),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: controller.surahs.length,
                itemBuilder: (BuildContext context, int index) {
                  final surah = controller.surahs[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: GestureDetector(
                      onTap: () async {
                        await ayahController.getAyah(surah.number);
                        await ayahController.getAyahTranslate(surah.number);
                        Get.to(AyahsScreen(
                          ayahs: ayahController.ayahs,
                          translate: ayahController.translatedAyah,
                          surahName: surah.name,
                        ));
                        print("success");
                      },
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      Text("${surah.number.toString()}. "),
                                      Text(
                                        surah.englishName,
                                        style: AppTextStyle.titleStyle,
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        surah.name,
                                        style: AppTextStyle.titleStyle,
                                      ),
                                      Text(
                                          " .${replaceFarsiNumber(surah.number.toString())}"),
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
