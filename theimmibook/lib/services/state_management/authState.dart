// ignore: file_names
import 'package:get/get.dart';
import 'package:theimmibook/services/storage/localGetStorage.dart';

class AuthState extends GetxController {
  // ignore: prefer_final_fields
  var _test = ''.obs;

  @override
  void onInit() async {
    super.onInit();

    _test.value = box.read('storage_test') ?? '';
    ever(_test, (callback) => box.write('storage_test', callback));
  }

  get test => _test;
}
