import 'package:flutter/material.dart';
import 'package:gbm_services/gbm_services.dart';
import 'package:visibility_detector/visibility_detector.dart';

class OMVisibilityBox extends StatefulWidget {
  final Widget child;

  const OMVisibilityBox({
    required this.child,
    super.key,
  });

  @override
  State<OMVisibilityBox> createState() => _OMVisibilityBoxState();
}

class _OMVisibilityBoxState extends State<OMVisibilityBox> {
  GBValueNotifier<double> visibleFraction = GBValueNotifier(0);
  final Duration _duration = Durations.extralong4;

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: UniqueKey(),
      onVisibilityChanged: (info) {
        visibleFraction.value = info.visibleFraction;
      },
      child: AnimatedBuilder(
        animation: visibleFraction.listenable,
        builder: (context, snapshot) {
          return AnimatedOpacity(
            opacity: visibleFraction.value,
            duration: _duration,
            child: AnimatedContainer(
              width: MediaQuery.of(context).size.width * visibleFraction.value + MediaQuery.of(context).size.width / 2,
              duration: _duration,
              child: widget.child,
            ),
          );
        },
      ),
    );
  }
}
