import 'package:flutter/material.dart';
import 'package:omen_tattoo_studio/widgets/navbar/base_page.dart';

class OMAboutWidget extends StatelessWidget {
  const OMAboutWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const OMBasePage(
      child: Text("about"),
    );
  }
}
