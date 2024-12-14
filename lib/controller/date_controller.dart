import 'package:get/get.dart';

class DateController extends GetxController {
  var selectedDate = ''.obs; // Observable variable for the date

  // Method to set the selected date
  void setDate(String date) {
    selectedDate.value = date;
  }
}
