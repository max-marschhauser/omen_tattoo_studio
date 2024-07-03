import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:omen_tattoo_studio/config/router_manager/app_router_files/app_routes/home_routes.dart';
import 'package:omen_tattoo_studio/config/styles/images.dart';
import 'package:omen_tattoo_studio/widgets/home_button.dart';

class OMHomeWidget extends StatelessWidget {
  const OMHomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(66, 66, 66, 1),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 64, vertical: 64),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                OMHomeButton(
                    title: "Portfolio",
                    function: () {
                      context.go(OMHomeRoute.portfolio.fullPath);
                    }),
                OMHomeButton(
                    title: "Savjeti",
                    function: () {
                      context.go(OMHomeRoute.advices.fullPath);
                    }),
                Image.asset(
                  OMImages.shared.logoMedium,
                  width: 400,
                  height: 400,
                ),
                OMHomeButton(
                    title: "Umjetnica",
                    function: () {
                      context.go(OMHomeRoute.about.fullPath);
                    }),
                OMHomeButton(
                    title: "Kontakt",
                    function: () {
                      context.go(OMHomeRoute.contacts.fullPath);
                    }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
