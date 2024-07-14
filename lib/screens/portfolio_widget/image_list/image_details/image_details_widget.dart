import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:omen_tattoo_studio/config/router_manager/app_router_files/app_routes/home_routes.dart';
import 'package:omen_tattoo_studio/data/sketches_list.dart';
import 'package:omen_tattoo_studio/data/tattoos_list.dart';
import 'package:omen_tattoo_studio/widgets/navbar/base_page.dart';

import '../../../../models/image.dart';

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
    if (widget.type == "sketches") {
      image = sketchesList.firstWhere(
        (element) {
          return element.id == widget.id;
        },
      );
    } else if (widget.type == "tattoos") {
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
    return OMBasePage(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          InkWell(
              onTap: () {
                int id = image!.id;

                if (id == 0) {
                  if (widget.type == "tattoos") {
                    id = tattoosList.length - 1;
                  }
                  if (widget.type == "sketches") {
                    id = sketchesList.length - 1;
                  }
                } else {
                  id -= 1;
                }

                Navigator.of(context).pop();
                context.go("${OMHomeRoute.details.fullPath}?type=${widget.type}&id=$id");
              },
              child: const Text("Button -")),
          Column(
            children: [
              Text(
                image!.id.toString(),
                style: Theme.of(context).textTheme.titleLarge,
              ),
              Image.asset(image!.image),
            ],
          ),
          InkWell(
              onTap: () {
                int id = image!.id;

                if ((widget.type == "tattoos" && id >= tattoosList.length - 1) || (widget.type == "sketches" && id >= sketchesList.length - 1)) {
                  id = 0;
                } else {
                  id += 1;
                }

                Navigator.of(context).pop();
                context.go("${OMHomeRoute.details.fullPath}?type=${widget.type}&id=$id");
              },
              child: const Text("Button +")),
        ],
      ),
    );
  }
}
