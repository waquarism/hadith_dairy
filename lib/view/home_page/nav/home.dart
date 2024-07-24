import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../const/widget_helpers/app_text.dart';
import '../../../controller/auth_controller.dart';
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
    final AuthController authController = Get.put(AuthController());
    final HomePageController homePageController= Get.put(HomePageController());

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
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Icon(
                Icons.hd,
                color: Color(0xffffffff),
                size: 54,
              ),
              InkWell(
                onTap: () async {
                  await authController.logout();
                  navigate();
                },
                child: const Icon(
                  Icons.explore,
                  color: Color(0xffffffff),
                  size: 54,
                ),
              ),
            ],
          ).marginSymmetric(vertical: 44, horizontal: 24),
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
                        size:
                            i == homePageController.currentTab.value ? 24 : 14,
                      ),
                    ).paddingOnly(bottom: 24),
                  ],
                ],
              );
            },
          ),
          Obx(
            () {
              return Container(
                child: tabs.elementAt(homePageController.currentTab.value),
              );
            },
          ),
        ],
      );
  }
}