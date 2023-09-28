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
          Container(
            margin: const EdgeInsets.only(bottom: 16.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: Text(
                    "Tópicos Populares",
                    style: theme.textTheme.headlineSmall,
                  ),
                ),
                SizedBox(
                  height: 128,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      _buildLanguageCard("Java", const Color(0xFFB07219), 30),
                      _buildLanguageCard("CSS", const Color(0xFF563D7C), 24),
                      _buildLanguageCard("JS", const Color(0xFFF1E05A), 10),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Text(
            "Tendencias",
            style: theme.textTheme.headlineSmall,
          ),
        ],
      ),
    );
  }

  Widget _buildLanguageCard(String language, Color color, int posts) {
    final textColor =
        color.computeLuminance() > 0.5 ? Colors.black : Colors.white;
    final headingStyle =
        theme.textTheme.headlineSmall!.copyWith(color: textColor);
    final textStyle = theme.textTheme.bodyMedium!.copyWith(color: textColor);

    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: const BorderRadius.all(Radius.circular(16.0))
      ),
      width: 128,
      height: 128,
      margin: const EdgeInsets.only(right: 16.0),
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(language, style: headingStyle),
          Text("$posts posts", style: textStyle,)
        ],
      ),
    );
  }
}