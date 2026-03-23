import 'package:flutter/material.dart';
import 'package:kadro_app/shared/ui/widgets/cashed_image.dart';

class HistoryListTile extends StatelessWidget {
  final String title;
  final String description;
  final String imageUrl;
  final VoidCallback onTap;

  const HistoryListTile({
    super.key,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Card(
      child: SizedBox(
        height: 162,
        child: InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              spacing: 16,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                    borderRadius: BorderRadiusGeometry.circular(6),
                    child: SizedBox(
                        width: 100,
                        child: CashedImage(url: imageUrl)
                    )
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    spacing: 8,
                    children: [
                      Text(
                        title,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: textTheme.titleMedium,
                      ),
                      Expanded(
                          child: Text(
                              description,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 5,
                          )
                      )
                    ],
                  )
                )
              ],
            ),
          ),
        ),
      )
    );
  }
}
