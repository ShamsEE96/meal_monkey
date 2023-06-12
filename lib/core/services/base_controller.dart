import 'package:get/get.dart';
import 'package:meal_monkey/core/enums/operation_type.dart';
import 'package:meal_monkey/core/enums/request_status.dart';

class BaseController extends GetxController {
  var requestStatus = RequestStatus.DEFAULT.obs;
  var operationType = OperationType.NONE.obs;

  set setRequestStatus(RequestStatus value) {
    requestStatus.value = value;
  }

  set setOperationType(OperationType value) {
    operationType.value = value;
  }

  Future runFutureFunction({
    required Future function,
  }) async {
    await function;
  }

  Future runFutureFunctionWithLoading({
    required Future function,
    OperationType? operationType = OperationType.NONE,
  }) async {
    setRequestStatus = RequestStatus.LOADING;
    setOperationType = operationType!;
    await function;
    setRequestStatus = RequestStatus.DEFAULT;
    setOperationType = OperationType.NONE;
  }
}
