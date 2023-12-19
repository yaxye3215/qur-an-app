import 'package:get/get.dart';

import '../../models/sutah/surahmodel.dart';
import '../../service/surah/surahApi.dart';

class AllSurahController extends GetxController {
  RxList<Reference> surahs = <Reference>[].obs;

  @override
  void onInit() {
    super.onInit();
    getSurah();
  }

  Future<void> getSurah() async {
    surahs.value = await SurahApi().getSurah();
    print(surahs[0].name);
  }
}
