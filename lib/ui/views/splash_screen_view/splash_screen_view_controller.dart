import 'package:get/get.dart';
import 'package:meal_monkey/core/data/repositories/shared_preferences_repository.dart';
import 'package:meal_monkey/core/services/base_controller.dart';
import 'package:meal_monkey/ui/views/intro_view/intro_view.dart';
import 'package:meal_monkey/ui/views/landing_view/landing_view.dart';
import 'package:meal_monkey/ui/views/main_view/main_view.dart';

class SplashScreenController extends BaseController {
  @override
  void onInit() {
    Future.delayed(
      Duration(seconds: 4),
    ).then(
      (value) {
        if (SharedPreferencesRepository.getFirstLaunch() &&
            SharedPreferencesRepository.getTokenInfo() == null) {
          Get.off(() => IntroView());
        } else
          Get.off(
            () => SharedPreferencesRepository.isLoggedIn
                ? MainView()
                : LandingView(),
          );

        SharedPreferencesRepository.setFirstLaunch(false);
      },
    );
    super.onInit();
  }
}
