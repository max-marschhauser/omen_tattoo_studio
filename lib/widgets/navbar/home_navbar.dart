import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../config/router_manager/app_router_files/app_routes/home_routes.dart';
import '../../config/styles/color.dart';
import '../../config/styles/images.dart';
import 'navbar_button.dart';

class OMHomeNavbar extends StatelessWidget {
  const OMHomeNavbar({super.key});

  @override
  Widget build(BuildContext context) {
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
              OMNavbarButton(
                  title: "Portfolio",
                  isHome: true,
                  function: () {
                    context.go(OMHomeRoute.portfolio.fullPath);
                  }),
              OMNavbarButton(
                  title: "Savjeti",
                  isHome: true,
                  function: () {
                    context.go(OMHomeRoute.advices.fullPath);
                  }),
              Container(
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(200), color: Colors.white),
                width: 400,
                height: 400,
                padding: const EdgeInsets.all(8),
                child: Image.asset(
                  OMImages.shared.logoTransparent,
                  // width: 400,
                  // height: 400,
                ),
              ),
              OMNavbarButton(
                  title: "Umjetnica",
                  isHome: true,
                  function: () {
                    context.go(OMHomeRoute.about.fullPath);
                  }),
              OMNavbarButton(
                  title: "Kontakt",
                  isHome: true,
                  function: () {
                    context.go(OMHomeRoute.contacts.fullPath);
                  }),
            ],
          ),
        ),
      ],
    );
  }
}
