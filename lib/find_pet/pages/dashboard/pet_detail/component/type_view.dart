import 'package:flutter/material.dart';

class TypeView extends StatelessWidget {
  const TypeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _getWidget(theme, 'Sexo', 'Macho'),
        _getWidget(theme, 'Color', 'Marron'),
      ],
    );
  }

  Widget _getWidget(
    final ThemeData theme,
      final String label,
      final String value,
  ) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 29),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: theme.colorScheme.primary),
        borderRadius: BorderRadius.circular(18.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            label,
            style: theme.textTheme.bodyText1,
          ),
          Text(
            value,
            style: theme.textTheme.caption,
          ),
        ],
      ),
    );
  }
}
