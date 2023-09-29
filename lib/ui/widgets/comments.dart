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
      width: MediaQuery.of(context).size.width,
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
          Expanded(
            child: Column(
              children: [
                Text(
                  "Tendencias",
                  style: theme.textTheme.headlineSmall,
                ),
                Expanded(
                  child: ListView(
                    children: const [
                      TrendsWidget(
                        profileIcon: Icon(Icons.person_outline),
                        user: "Miguel Pérez",
                        timeInterval: "Hace 1 hora",
                        post: "Java es un lenguaje de programación y una "
                            "plataforma informática que fue comercializada "
                            "por primera vez por Sun Microsystems",
                        likes: 120,
                        views: 200,
                      ),
                      TrendsWidget(
                        profileIcon: Icon(Icons.person_outline),
                        user: "Mirna Fonseca",
                        timeInterval: "Hace 2 horas",
                        post: "Most of the exercises focus on the C++ "
                            "programming language, the C++ standard library, "
                            "and... (PDF)",
                        likes: 50,
                        views: 120,
                      )
                    ],
                  ),
                )
              ],
            ),
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

class TrendsWidget extends StatelessWidget {
  final Widget profileIcon;
  final String user;
  final String timeInterval;
  final String post;
  final int likes;
  final int views;

  const TrendsWidget(
      {super.key,
      required this.profileIcon,
      required this.user,
      required this.timeInterval,
      required this.post,
      required this.likes,
      required this.views});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          ListTile(
            title: Text(user),
            subtitle: Text(timeInterval),
            leading: profileIcon,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16.0),
            child: Text(post),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    const Icon(Icons.thumb_up_alt_outlined),
                    const SizedBox(width: 8.0),
                    Text("$likes Likes"),
                  ],
                ),
                Row(
                  children: [
                    const Icon(Icons.remove_red_eye_outlined),
                    const SizedBox(width: 8.0),
                    Text("$views Views"),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
