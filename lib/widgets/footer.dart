import 'package:flutter/material.dart';

import '../config/styles/color.dart';

class OMFooterWidget extends StatelessWidget {
  const OMFooterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32),
      color: OMColors.backgroundColor,
      child: Center(
        child: Text(
          "OMEN Tattoo Studio",
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: OMColors.lightGray,
              ),
        ),
      ),
    );
  }
}
