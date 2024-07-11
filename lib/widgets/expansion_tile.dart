import 'package:flutter/material.dart';

class OMExpansionTile extends StatelessWidget {
  final String title;
  final String content;

  const OMExpansionTile({
    required this.title,
    required this.content,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      tilePadding: const EdgeInsets.symmetric(horizontal: 64),
      childrenPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 64),
      title: Text(
        title,
        overflow: TextOverflow.ellipsis,
        maxLines: 2,
        style: Theme.of(context).textTheme.titleMedium,
      ),
      controller: ExpansionTileController(),
      children: [
        SizedBox(
          width: double.infinity,
          child: Text(
            content,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        )
      ],
    );
  }
}
