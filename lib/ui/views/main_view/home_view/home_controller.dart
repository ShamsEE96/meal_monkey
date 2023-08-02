import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meal_monkey/core/data/models/apis/category_model.dart';
import 'package:meal_monkey/core/data/models/apis/meal_model.dart';
import 'package:meal_monkey/core/data/repositories/category_repository.dart';
import 'package:meal_monkey/core/data/repositories/meal_repository.dart';
import 'package:meal_monkey/core/enums/connectivity_status.dart';
import 'package:meal_monkey/core/enums/message_type.dart';
import 'package:meal_monkey/core/enums/operation_type.dart';
import 'package:meal_monkey/core/enums/request_status.dart';
import 'package:meal_monkey/core/services/base_controller.dart';
import 'package:meal_monkey/ui/shared/custom_widgets/custom_toast.dart';
import 'package:meal_monkey/ui/shared/utils.dart';

class HomeController extends BaseController {
  TextEditingController searchController = TextEditingController();

  RxList<CategoryModel> categoryList = <CategoryModel>[].obs;
  RxList<MealModel> mealList = <MealModel>[].obs;
  RxBool isOnline = true.obs;

  void checkConnection() {
    connectivityService.connectivityStatusController.stream.listen((event) {
      isOnline.value = event == ConnectivityStatus.ONLINE;
    });
  }

  bool get isCategoryLoading =>
      requestStatus == RequestStatus.LOADING &&
      operationTypeList.contains(OperationType.CATEGORY);
  // operationType == OperationType.CATEGORY;

  bool get isMealLoading =>
      requestStatus == RequestStatus.LOADING &&
      operationTypeList.contains(OperationType.MEAL);
  // operationType == OperationType.MEAL;

  @override
  void onInit() {
    getAllCategory();
    getAllMeal();
    increaseNotificationCount();
    super.onInit();
  }

  @override
  void onReady() {
    checkConnection();
    super.onReady();
  }

  void getAllCategory() {
    runFutureFunctionWithLoading(
      operationType: OperationType.CATEGORY,
      function: CategoryRepository().getAll().then(
        (value) {
          value.fold(
            (l) {
              CustomToast.showMessage(
                message: l,
                messageType: MessageType.REJECTED,
              );
            },
            (r) {
              // categoryList.clear();
              categoryList.addAll(r);
            },
          );
        },
      ),
    );
  }

  void getAllMeal() {
    runFutureFunctionWithLoading(
      operationType: OperationType.MEAL,
      function: MealRepository().getAll().then(
        (value) {
          value.fold(
            (l) {
              CustomToast.showMessage(
                message: l,
                messageType: MessageType.REJECTED,
              );
            },
            (r) {
              // mealList.clear();
              mealList.addAll(r);
            },
          );
        },
      ),
    );
  }

  void addToCart({required MealModel mealModel}) {
    cartService.addToCartList(
      mealModel: mealModel,
      count: 1,
      afterAdd: () {
        CustomToast.showMessage(
          message: 'Added to Cart',
          messageType: MessageType.SUCCESS,
        );
      },
    );
  }

  RxInt notifcationCount = 0.obs;

  void increaseNotificationCount() {
    notificationService.notifcationStream.stream.listen((event) {
      notifcationCount.value++;
    });
  }
}
