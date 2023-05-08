import 'package:get/get.dart';
import 'package:theimmibook/services/state_management/authState.dart';

AuthState getAuthStateController() {
  if (Get.isRegistered<AuthState>()) {
    print('AuthController already exists');
    return Get.find<AuthState>();
  } else {
    print('AuthController will be created now');
    return Get.put(AuthState());
  }
}

// controllers to be used later in other files/functions

AuthState authStateController = getAuthStateController();
