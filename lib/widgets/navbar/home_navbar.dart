import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:omen_tattoo_studio/config/styles/breakpoints.dart';

import '../../config/router_manager/app_router_files/app_routes/home_routes.dart';
import '../../config/styles/color.dart';
import '../../config/styles/images.dart';
import 'navbar_button.dart';

class OMHomeNavbar extends StatelessWidget {
  const OMHomeNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    List<OMNavbarButtonItem> navbarButtonItemList = [
      OMNavbarButtonItem(
        title: "Portfolio",
        function: () {
          context.go(OMHomeRoute.portfolio.fullPath);
        },
      ),
      OMNavbarButtonItem(
        title: "Savjeti",
        function: () {
          context.go(OMHomeRoute.advices.fullPath);
        },
      ),
      OMNavbarButtonItem(
        title: "Umjetnica",
        function: () {
          context.go(OMHomeRoute.about.fullPath);
        },
      ),
      OMNavbarButtonItem(
        title: "Kontakti",
        function: () {
          context.go(OMHomeRoute.contacts.fullPath);
        },
      ),
    ];
    double screenWidth = MediaQuery.of(context).size.width;
    bool isLargeScreen = screenWidth > OMBreakpoints.largeScreen;

    List<Widget> children1 = [
      OMNavbarButton(title: navbarButtonItemList[0].title, isHome: true, function: navbarButtonItemList[0].function),
      OMNavbarButton(title: navbarButtonItemList[1].title, isHome: true, function: navbarButtonItemList[1].function),
    ];

    List<Widget> children2 = [
      OMNavbarButton(title: navbarButtonItemList[2].title, isHome: true, function: navbarButtonItemList[2].function),
      OMNavbarButton(title: navbarButtonItemList[3].title, isHome: true, function: navbarButtonItemList[3].function),
    ];

    Widget logoImage = Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(200), color: Colors.white),
      width: isLargeScreen ? 400 : 200,
      height: isLargeScreen ? 400 : 200,
      padding: const EdgeInsets.all(8),
      child: Image.asset(
        OMImages.shared.logoTransparent,
        // width: 400,
        // height: 400,
      ),
    );

    if (isLargeScreen) {
      return Stack(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 254),
            child: Divider(
              color: OMColors.lightGray,
              thickness: 10,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 128, vertical: 64),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ...children1,
                logoImage,
                ...children2,
              ],
            ),
          ),
        ],
      );
    } else {
      return SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              logoImage,
              ...children1.map(
                (e) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 24),
                    child: e,
                  );
                },
              ),
              ...children2.map(
                (e) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 24),
                    child: e,
                  );
                },
              ),
            ],
          ),
        ),
      );
    }
  }
}
