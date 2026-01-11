import 'package:flutter/material.dart';

class CharacterCard extends StatelessWidget {
  const CharacterCard({
    super.key,
    required this.image,
    required this.name,
    required this.status,
    required this.gender,
    required this.favoriteButton,
  });

  final String image;
  final String name;
  final String status;
  final String gender;
  final Widget favoriteButton;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                image,
                width: 90,
                height: 90,
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return const SizedBox(
                    width: 72,
                    height: 72,
                    child: Center(
                      child: CircularProgressIndicator(strokeWidth: 2),
                    ),
                  );
                },
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    width: 72,
                    height: 72,
                    color: Colors.grey.shade300,
                    alignment: Alignment.center,
                    child: const Icon(Icons.person, size: 32),
                  );
                },
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name, style: theme.textTheme.titleLarge),
                  const SizedBox(height: 4),
                  infoAboutCharacter(
                    title: 'Status',
                    value: status,
                    theme: theme,
                  ),
                  infoAboutCharacter(
                    title: 'Gender',
                    value: gender,
                    theme: theme,
                  ),
                ],
              ),
            ),
            favoriteButton,
          ],
        ),
      ),
    );
  }

  Widget infoAboutCharacter({
    required String title,
    required String value,
    required ThemeData theme,
  }) {
    return RichText(
      text: TextSpan(
        text: '$title: ',
        style: theme.textTheme.titleMedium,
        children: [TextSpan(text: value, style: theme.textTheme.bodyMedium)],
      ),
    );
  }
}
