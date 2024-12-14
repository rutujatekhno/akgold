import 'package:get/get.dart';

class CheckBoxController extends GetxController {
  var checkBoxValue = false.obs;
  var isChecked = false.obs;

  void toggleCheckbox() {
    isChecked.value = !isChecked.value;
  }

  void toggleCheckBox() {
    checkBoxValue.value = !checkBoxValue.value;
  }
}
