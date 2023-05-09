import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:theimmibook/services/state_management/auth_state.dart';

AuthState getAuthStateController() {
  if (Get.isRegistered<AuthState>()) {
    if (kDebugMode) {
      print('AuthController already exists');
    }
    return Get.find<AuthState>();
  } else {
    if (kDebugMode) {
      print('AuthController will be created now');
    }
    return Get.put(AuthState());
  }
}

// controllers to be used later in other files/functions

AuthState authStateController = getAuthStateController();
