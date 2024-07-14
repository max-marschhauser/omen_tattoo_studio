import 'package:flutter/material.dart';
import 'package:gbm_services/gbm_services.dart';
import 'package:go_router/go_router.dart';
import 'package:omen_tattoo_studio/config/router_manager/app_router_files/app_routes/home_routes.dart';
import 'package:omen_tattoo_studio/widgets/navbar/base_page.dart';

import '../../config/styles/images.dart';

class OMPortfolioWidget extends StatefulWidget {
  const OMPortfolioWidget({super.key});

  @override
  State<OMPortfolioWidget> createState() => _OMPortfolioWidgetState();
}

class _OMPortfolioWidgetState extends State<OMPortfolioWidget> {
  GBValueNotifier<bool> onHoverSketches = GBValueNotifier(false);
  GBValueNotifier<bool> onHoverTattoos = GBValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return OMBasePage(
      child: Row(
        children: [
          image(
              onHover: onHoverSketches,
              image: OMImages.shared.logoLarge,
              callback: () {
                context.go(OMHomeRoute.sketches.fullPath);
              }),
          image(
              onHover: onHoverTattoos,
              image: OMImages.shared.logoLarge,
              callback: () {
                context.go(OMHomeRoute.tattoos.fullPath);
              }),
        ],
      ),
    );
  }

  Widget image({required GBValueNotifier<bool> onHover, required Function callback, required String image}) {
    return InkWell(
      onTap: () {
        callback();
      },
      onHover: (value) {
        onHover.value = value;
        setState(() {});
      },
      child: AnimatedOpacity(
        opacity: onHover.value ? 1 : 0.5,
        duration: Durations.short4,
        child: Image.asset(
          image,
          width: MediaQuery.of(context).size.width / 2,
        ),
      ),
    );
  }
}
