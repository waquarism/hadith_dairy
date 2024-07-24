import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:hadith_diary/view/home_page/nav/home.dart';

import '../../const/widget_helpers/app_text.dart';
import '../../controller/auth_controller.dart';
import '../../controller/home_page_controller.dart';
import '../auth_page/auth_page.dart';
import 'home_tabs/finance_page.dart';
import 'home_tabs/health_page.dart';
import 'home_tabs/sports_page.dart';
import 'home_tabs/trending_page.dart';
import 'nav/save.dart';
import 'nav/search.dart';

class Homepage extends StatelessWidget {
  static const String routeName = '/home-page';

  static Route<void> route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const Homepage(),
    );
  }

  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    final HomePageController homePageController = Get.put(HomePageController());

    const List<Widget> navs = [
      Home(),
      Search(),
      Save(),
    ];

    const List<IconData> navIcons = [
      Icons.home_rounded,
      Icons.search_rounded,
      Icons.save_rounded,
    ];

    return Scaffold(
      backgroundColor: const Color(0xff111111),
      body: Obx(() {
        return Container(
          child: navs.elementAt(homePageController.currentNavPage.value),
        );
      }),
      bottomNavigationBar: BottomAppBar(
        color: Colors.transparent,
        shape: const CircularNotchedRectangle(),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.black54, borderRadius: BorderRadius.circular(54)),
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 10.0),
          child: Obx(() {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                for (int i = 0; i < navIcons.length; i++) ...[
                  InkWell(
                    onTap: () {
                      homePageController.updateNavPage(i);
                    },
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    child: Icon(
                      navIcons[i],
                      color: i == homePageController.currentNavPage.value
                          ? Colors.white
                          : Colors.white54,
                      size: i == homePageController.currentNavPage.value
                          ? 36
                          : 24,
                    ),
                  ),
                ],
              ],
            );
          }),
        ),
      ),
    );
  }
}
