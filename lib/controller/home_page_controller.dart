import 'package:get/get.dart';

class HomePageController extends GetxController{
  static HomePageController get instance => Get.find();

  RxInt currentTab = 0.obs;
  RxInt currentNavPage = 0.obs;

  void updateTab(int index){
    currentTab.value = index;
  }

  void updateNavPage(int index){
    currentNavPage.value = index;
  }

  

}