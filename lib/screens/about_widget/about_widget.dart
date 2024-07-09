import 'package:flutter/material.dart';

import '../../config/styles/color.dart';
import '../../widgets/navbar/navbar_widget.dart';

class OMAboutWidget extends StatelessWidget {
  const OMAboutWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: OMColors.lightGray,
      body: Column(
        children: [
          OMNavbarWidget(),
          Text("about"),
        ],
      ),
    );
  }
}
