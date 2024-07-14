import 'package:flutter/material.dart';
import 'package:gbm_services/gbm_services.dart';
import 'package:go_router/go_router.dart';
import 'package:omen_tattoo_studio/widgets/navbar/base_page.dart';

import '../../../config/router_manager/app_router_files/app_routes/home_routes.dart';
import '../../../data/sketches_list.dart';
import '../../../data/tattoos_list.dart';
import '../../../models/image.dart';
import '../../../widgets/visibility_box.dart';

class OMImageListWidget extends StatefulWidget {
  final bool isTattoo;

  const OMImageListWidget({
    required this.isTattoo,
    super.key,
  });

  @override
  State<OMImageListWidget> createState() => _OMImageListWidgetState();
}

class _OMImageListWidgetState extends State<OMImageListWidget> {
  @override
  Widget build(BuildContext context) {
    return OMBasePage(
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

class OMImageItemWidget extends StatefulWidget {
  final OMImage item;
  final OMListType type;

  const OMImageItemWidget({
    required this.item,
    required this.type,
    super.key,
  });

  @override
  State<OMImageItemWidget> createState() => _OMImageItemWidgetState();
}

class _OMImageItemWidgetState extends State<OMImageItemWidget> {
  GBValueNotifier<bool> hoverImage = GBValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.go("${OMHomeRoute.details.fullPath}?type=${widget.type.name}&id=${widget.item.id}");
      },
      onHover: (value) {
        hoverImage.value = value;
        setState(() {});
      },
      child: AnimatedOpacity(
        opacity: hoverImage.value ? 1 : 0.5,
        duration: Durations.short4,
        child: SizedBox(
          width: 400,
          child: OMVisibilityBox(
            child: Image.asset(widget.item.image, width: 400, height: 400),
          ),
        ),
      ),
    );
  }
}
