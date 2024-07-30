import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../const/images.dart';
import '../../../const/widget_helpers/app_text.dart';
import '../../../controller/auth_controller.dart';
import '../../../controller/news_controller.dart';
import '../../../controller/home_page_controller.dart';
import '../../auth_page/auth_page.dart';
import '../home_tabs/finance_page.dart';
import '../home_tabs/health_page.dart';
import '../home_tabs/sports_page.dart';
import '../home_tabs/trending_page.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    // final AuthController authController = Get.put(AuthController());
    final HomePageController homePageController = Get.put(HomePageController());
    final NewsController newsController = Get.put(NewsController());

    void navigate() {
      Navigator.pushReplacement(context, AuthPage.route());
    }

    const List<Widget> tabs = [
      TrendingPage(),
      HealthPage(),
      SportsPage(),
      FinancePage(),
    ];

    const List<String> tabsName = [
      "Trending",
      "Health",
      "Sports",
      "Finance",
    ];

    return Column(
      // mainAxisSize: double.infinity,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Obx(() {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                Images.hdLogoWhite,
                scale: 4,
              ),
              InkWell(
                onTap: (){
                  newsController.showNews();
                },
                child: Visibility(
                  visible: !newsController.isLoading.value,
                  replacement: const CircularProgressIndicator(),
                  child: const Icon(
                    Icons.grid_view_rounded,
                    color: Color(0xffffffff),
                    size: 32,
                  ),
                ),
              ),
            ],
          ).paddingSymmetric(horizontal: 24, vertical: 24);
        }),
        Obx(
          () {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                for (int i = 0; i < tabsName.length; i++) ...[
                  InkWell(
                    onTap: () {
                      homePageController.updateTab(i);
                    },
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    child: AppText.headingText(
                      text: tabsName[i],
                      color: i == homePageController.currentTab.value
                          ? Colors.white
                          : Colors.white54,
                      size: i == homePageController.currentTab.value ? 24 : 14,
                    ),
                  ).paddingOnly(bottom: 24),
                ],
              ],
            );
          },
        ),
        Obx(
          () {
            return Expanded(
              child: Container(
                child: tabs.elementAt(homePageController.currentTab.value),
              ),
            );
          },
        ),
      ],
    );
  }
}
