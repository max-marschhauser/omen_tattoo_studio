import 'package:flutter/material.dart';

import '../../config/styles/color.dart';
import '../../data/sketches_list.dart';
import '../../data/tattoos_list.dart';
import '../../widgets/navbar/navbar_widget.dart';
import 'image_item_widget.dart';

class OMImageListWidget extends StatefulWidget {
  final bool isTattoo;

  const OMImageListWidget({
    required this.isTattoo,
    super.key,
  });

  @override
  State<OMImageListWidget> createState() => _OMImageListWidgetState();
}

class _OMImageListWidgetState extends State<OMImageListWidget> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      backgroundColor: OMColors.lightGray,
      body: Column(
        children: [
          const OMNavbarWidget(),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Wrap(
                  runSpacing: 20,
                  spacing: 20,
                  children: [
                    ...list(),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  List<Widget> list() {
    if (widget.isTattoo) {
      return tattoosList.map(
        (e) {
          return OMImageItemWidget(item: e, type: OMListType.tattoos);
        },
      ).toList();
    } else {
      return sketchesList.map(
        (e) {
          return OMImageItemWidget(item: e, type: OMListType.sketches);
        },
      ).toList();
    }
  }
}

enum OMListType { sketches, tattoos }
