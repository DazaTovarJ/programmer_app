import 'package:flutter/material.dart';

class CommentsWidget extends StatelessWidget {
  const CommentsWidget({
    super.key,
    required this.theme,
  });

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      width: MediaQuery.of(context)
          .size
          .width, // Comentar al terminar de co
      decoration: BoxDecoration(
        color: theme.colorScheme.primaryContainer,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(16.0),
          topRight: Radius.circular(16.0),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Tópicos Populares",
            style: theme.textTheme.headlineSmall,
          ),
          Text(
            "Tendencias",
            style: theme.textTheme.headlineSmall,
          ),
        ],
      ),
    );
  }
}