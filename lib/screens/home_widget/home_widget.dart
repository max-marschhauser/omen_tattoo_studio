import 'package:flutter/material.dart';

import '../../config/styles/color.dart';
import '../../widgets/navbar/home_navbar.dart';

class OMHomeWidget extends StatelessWidget {
  const OMHomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: OMColors.backgroundColor,
      body: Center(child: OMHomeNavbar()),
    );
  }
}
