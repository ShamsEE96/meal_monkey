import 'package:get/get.dart';
import 'package:meal_monkey/core/services/base_controller.dart';

class IntroController extends BaseController {
  RxList<String> titleList = [
    'Find Food You Love',
    'Fast Delivery',
    'Live Tracking',
  ].obs;
  RxList<String> descriptionList = [
    'Discover the best foods from over 1,000 \n restaurants and fast delivery to your doorstep',
    'Fast food delivery to your home, office \n wherever you are',
    'Real time tracking of your food on the app \n once you placed the order,'
  ].obs;
  RxInt currentIndex = 0.obs;
}
