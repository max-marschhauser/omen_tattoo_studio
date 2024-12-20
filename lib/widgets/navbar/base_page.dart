import 'package:flutter/material.dart';
import 'package:omen_tattoo_studio/widgets/footer.dart';

import '../../config/styles/color.dart';
import 'navbar_widget.dart';

class OMBasePage extends StatelessWidget {
  final Widget child;

  const OMBasePage({
    required this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: OMColors.lightGray,
      body: Column(
        children: [
          const OMNavbarWidget(),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  child,
                  const OMFooterWidget(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
