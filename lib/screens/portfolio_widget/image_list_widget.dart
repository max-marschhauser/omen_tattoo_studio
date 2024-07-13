import 'package:flutter/material.dart';
import 'package:omen_tattoo_studio/widgets/visibility_box.dart';

import '../../config/styles/color.dart';
import '../../data/image_list.dart';
import '../../widgets/navbar/navbar_widget.dart';

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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    color: OMColors.backgroundColor,
                    width: MediaQuery.of(context).size.width,
                    height: 1,
                  ),
                  ...imageList
                      .where(
                        (element) {
                          if (widget.isTattoo) {
                            return element.isTattoo == true;
                          } else {
                            return element.isTattoo == false;
                          }
                        },
                      )
                      .toList()
                      .map(
                        (e) {
                          return OMVisibilityBox(child: Image.asset(e.image, width: 400, height: 400));
                        },
                      ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
