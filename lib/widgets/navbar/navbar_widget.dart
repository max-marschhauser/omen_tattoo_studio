import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:omen_tattoo_studio/widgets/navbar/navbar_button.dart';

import '../../config/router_manager/app_router_files/app_routes/home_routes.dart';
import '../../config/styles/breakpoints.dart';
import '../../config/styles/color.dart';
import '../../config/styles/images.dart';

class OMNavbarWidget extends StatelessWidget {
  const OMNavbarWidget({super.key});

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

    Widget logoImage = Material(
      borderRadius: BorderRadius.circular(200),
      child: InkWell(
        borderRadius: BorderRadius.circular(200),
        onTap: () {
          context.go(OMHomeRoute.home.fullPath);
        },
        child: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(200)),
          width: 128,
          height: 128,
          padding: const EdgeInsets.all(6),
          child: Image.asset(
            OMImages.shared.logoTransparent,
            // width: 400,
            // height: 400,
          ),
        ),
      ),
    );

    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 72),
          decoration: const BoxDecoration(color: OMColors.backgroundColor),
          child: const Divider(
            color: OMColors.lightGray,
            thickness: 10,
          ),
        ),
        isLargeScreen
            ? Padding(
                padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 128),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    OMNavbarButton(
                      title: navbarButtonItemList[0].title,
                      isHome: false,
                      function: navbarButtonItemList[0].function,
                    ),
                    OMNavbarButton(
                      title: navbarButtonItemList[1].title,
                      isHome: false,
                      function: navbarButtonItemList[1].function,
                    ),
                    logoImage,
                    OMNavbarButton(
                      title: navbarButtonItemList[2].title,
                      isHome: false,
                      function: navbarButtonItemList[2].function,
                    ),
                    OMNavbarButton(
                      title: navbarButtonItemList[3].title,
                      isHome: false,
                      function: navbarButtonItemList[3].function,
                    ),
                  ],
                ),
              )
            : Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Center(child: logoImage),
                    PopupMenuButton(
                      /// todo style menu icon
                      tooltip: "",
                      itemBuilder: (context) {
                        return navbarButtonItemList.map(
                          (e) {
                            return PopupMenuItem(
                              onTap: () {
                                e.function();
                              },
                              child: Text(
                                e.title,
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context).textTheme.titleLarge,
                              ),
                            );
                          },
                        ).toList();
                      },
                    ),
                  ],
                ),
              ),
      ],
    );
  }
}
