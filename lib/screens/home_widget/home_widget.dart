import 'package:flutter/material.dart';
import 'package:omen_tattoo_studio/config/styles/images.dart';

import '../../config/styles/color.dart';
import '../../widgets/navbar/home_navbar.dart';

class OMHomeWidget extends StatelessWidget {
  const OMHomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: OMColors.backgroundColor,
      body: Stack(
        children: [
          Opacity(
              opacity: 0.2,
              child: Image.asset(
                fit: BoxFit.cover,
                OMImages.shared.background,
                width: MediaQuery.of(context).size.width,
              )),
          const Center(child: OMHomeNavbar()),
        ],
      ),
    );
  }
}
