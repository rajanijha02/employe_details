import 'dart:async';

import 'package:employe_details/app/routes/app_pages.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  String isLoading = 'Loading...';
  @override
  void onInit() {
    super.onInit();
    validateToken();
  }

  validateToken() async {
    Timer(const Duration(seconds: 3), () {
      Get.offNamed(Routes.HOME);
    });
  }
}
