import 'package:flutter/material.dart';
import 'package:omen_tattoo_studio/config/styles/color.dart';

class OMNavbarButton extends StatelessWidget {
  final String title;
  final Function function;
  final bool isHome;

  const OMNavbarButton({
    required this.title,
    required this.function,
    required this.isHome,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(20),
      child: InkWell(
          hoverColor: OMColors.lightGray,
          borderRadius: BorderRadius.circular(20),
          onTap: () {
            function();
          },
          child: Container(
            decoration: BoxDecoration(border: Border.all(color: OMColors.backgroundColor, width: 10), borderRadius: BorderRadius.circular(20)),
            width: isHome ? 200 : 175,
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: isHome ? Theme.of(context).textTheme.displayLarge : Theme.of(context).textTheme.displayMedium,
            ),
          )),
    );
  }
}

class OMNavbarButtonItem {
  final String title;
  final Function function;

  OMNavbarButtonItem({
    required this.title,
    required this.function,
  });
}
