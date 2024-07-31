import 'package:get/get.dart';
import 'package:hadith_diary/controller/news_controller.dart';

class HomePageController extends GetxController{
  static HomePageController get instance => Get.find();

  RxInt currentTab = 0.obs;
  RxInt currentNavPage = 0.obs;

  @override
  void onReady() {
    Get.put(NewsController());
    super.onReady();
  }

  void updateTab(int index){
    currentTab.value = index;
  }

  void updateNavPage(int index){
    currentNavPage.value = index;
  }

  

}