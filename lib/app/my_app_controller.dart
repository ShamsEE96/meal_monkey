import 'package:get/get.dart';
import 'package:meal_monkey/core/enums/connectivity_status.dart';
import 'package:meal_monkey/core/services/base_controller.dart';
import 'package:meal_monkey/ui/shared/utils.dart';

class MyAppController extends BaseController {
  Rx<ConnectivityStatus> connectivityStatus = ConnectivityStatus.ONLINE.obs;

  set setConnectivityStatus(ConnectivityStatus value) {
    connectivityStatus.value = value;
  }

  void listenForConnectivityStatus() {
    connectivityService.connectivityStatusController.stream.listen((event) {
      setConnectivityStatus = event;
    });
  }

  @override
  void onInit() {
    listenForConnectivityStatus();
    super.onInit();
  }
}
