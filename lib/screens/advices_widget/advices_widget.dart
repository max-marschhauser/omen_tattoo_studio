import 'package:flutter/material.dart';
import 'package:omen_tattoo_studio/config/styles/color.dart';
import 'package:omen_tattoo_studio/config/styles/images.dart';
import 'package:omen_tattoo_studio/data/advices.dart';
import 'package:omen_tattoo_studio/models/advice.dart';
import 'package:omen_tattoo_studio/widgets/expansion_tile.dart';

import '../../widgets/navbar/navbar_widget.dart';

class OMAdvicesWidget extends StatelessWidget {
  const OMAdvicesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: OMColors.lightGray,
      body: Column(
        children: [
          const OMNavbarWidget(),
          Expanded(
              child: SingleChildScrollView(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                    decoration: const BoxDecoration(
                      border: Border(
                        right: BorderSide(color: OMColors.backgroundColor),
                      ),
                    ),
                    child: Column(
                      children: OMAdviceCategory.values.map(
                        (e) {
                          return Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 24),
                                child: Text(
                                  e.title,
                                  overflow: TextOverflow.ellipsis,
                                  style: Theme.of(context).textTheme.titleLarge,
                                ),
                              ),
                              ...advicesList
                                  .where(
                                    (element) {
                                      return element.category == e;
                                    },
                                  )
                                  .toList()
                                  .map(
                                    (e) {
                                      return OMExpansionTile(title: e.title, content: e.content);
                                    },
                                  ),
                              Divider(color: Theme.of(context).dividerColor),
                            ],
                          );
                        },
                      ).toList(),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 128, vertical: 64),
                    child: Center(
                      child: Image.asset(OMImages.shared.logoTransparent),
                    ),
                  ),
                )
              ],
            ),
          ))
        ],
      ),
    );
  }
}
