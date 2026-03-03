import 'package:flutter/material.dart';

class ErrorPlaceholder extends StatelessWidget {
  const ErrorPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      spacing: 8,
      children: [
        Center(
          child: Text(
            'Ууупс...',
            style: textTheme.displaySmall,
          ),
        ),
        Center(
          child: Text(
            'Что то пошло не по плану!',
            style: textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurface.withAlpha(150)
            ),
          ),
        )
      ],
    );
  }
}
