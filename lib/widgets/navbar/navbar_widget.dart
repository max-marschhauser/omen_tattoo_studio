import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:omen_tattoo_studio/widgets/navbar/navbar_button.dart';

import '../../config/router_manager/app_router_files/app_routes/home_routes.dart';
import '../../config/styles/color.dart';
import '../../config/styles/images.dart';

class OMNavbarWidget extends StatelessWidget {
  const OMNavbarWidget({super.key});

  @override
  Widget build(BuildContext context) {
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
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 128),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              OMNavbarButton(
                  title: "Portfolio",
                  isHome: false,
                  function: () {
                    context.go(OMHomeRoute.portfolio.fullPath);
                  }),
              OMNavbarButton(
                  title: "Savjeti",
                  isHome: false,
                  function: () {
                    context.go(OMHomeRoute.advices.fullPath);
                  }),
              Material(
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
              ),
              OMNavbarButton(
                  title: "Umjetnica",
                  isHome: false,
                  function: () {
                    context.go(OMHomeRoute.about.fullPath);
                  }),
              OMNavbarButton(
                  title: "Kontakt",
                  isHome: false,
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
