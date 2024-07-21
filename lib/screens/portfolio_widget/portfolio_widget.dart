import 'package:flutter/material.dart';
import 'package:gbm_services/gbm_services.dart';
import 'package:go_router/go_router.dart';
import 'package:omen_tattoo_studio/config/router_manager/app_router_files/app_routes/home_routes.dart';
import 'package:omen_tattoo_studio/widgets/navbar/base_page.dart';

import '../../config/styles/breakpoints.dart';
import '../../config/styles/images.dart';

class OMPortfolioWidget extends StatefulWidget {
  const OMPortfolioWidget({super.key});

  @override
  State<OMPortfolioWidget> createState() => _OMPortfolioWidgetState();
}

class _OMPortfolioWidgetState extends State<OMPortfolioWidget> {
  GBValueNotifier<bool> onHoverSketches = GBValueNotifier(false);
  GBValueNotifier<bool> onHoverTattoos = GBValueNotifier(false);

  double screenWidth = 0;
  bool isMediumScreen = true;

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    isMediumScreen = screenWidth > OMBreakpoints.mediumScreen;

    List<Widget> children = [
      _image(
          onHover: onHoverSketches,
          image: OMImages.shared.logoLarge,
          callback: () {
            context.go(OMHomeRoute.sketches.fullPath);
          }),
      _image(
          onHover: onHoverTattoos,
          image: OMImages.shared.logoLarge,
          callback: () {
            context.go(OMHomeRoute.tattoos.fullPath);
          }),
    ];

    return OMBasePage(
      child: isMediumScreen
          ? Row(
              children: children,
            )
          : Column(
              children: children,
            ),
    );
  }

  Widget _image({required GBValueNotifier<bool> onHover, required Function callback, required String image}) {
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
          width: isMediumScreen ? MediaQuery.of(context).size.width / 2 : MediaQuery.of(context).size.width,
        ),
      ),
    );
  }
}
