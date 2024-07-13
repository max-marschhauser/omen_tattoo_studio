import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:omen_tattoo_studio/config/router_manager/app_router_files/app_routes/home_routes.dart';
import 'package:omen_tattoo_studio/data/sketches_list.dart';
import 'package:omen_tattoo_studio/screens/portfolio_widget/image_list_widget.dart';

import '../../models/image.dart';

class OMImageDetailsWidget extends StatefulWidget {
  final String type;
  final int id;

  const OMImageDetailsWidget({
    required this.type,
    required this.id,
    super.key,
  });

  @override
  State<OMImageDetailsWidget> createState() => _OMImageDetailsWidgetState();
}

class _OMImageDetailsWidgetState extends State<OMImageDetailsWidget> {
  OMImage? image;

  @override
  void initState() {
    OMListType? type;

    if (widget.type == "tattoos") {
      type = OMListType.tattoos;
    } else if (widget.type == "sketches") {
      type = OMListType.sketches;
    }

    if (type == null) {
      context.go(OMHomeRoute.portfolio.fullPath);
    } else if (type == OMListType.sketches) {
      image = sketchesList.firstWhere(
        (element) {
          return element.id == widget.id;
        },
      );
    } else if (type == OMListType.tattoos) {
      image = sketchesList.firstWhere(
        (element) {
          return element.id == widget.id;
        },
      );
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(image!.title),
        Text(image!.image),
      ],
    );
  }
}
