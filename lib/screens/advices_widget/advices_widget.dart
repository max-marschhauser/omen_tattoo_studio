import 'package:flutter/material.dart';
import 'package:omen_tattoo_studio/config/styles/color.dart';

import '../../widgets/navbar/navbar_widget.dart';

class OMAdvicesWidget extends StatelessWidget {
  const OMAdvicesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: OMColors.lightGray,
      body: Column(
        children: [
          OMNavbarWidget(),
          Text("advices"),
        ],
      ),
    );
  }
}
