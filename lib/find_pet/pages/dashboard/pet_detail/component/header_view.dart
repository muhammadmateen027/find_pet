import 'package:flutter/material.dart';

class HeaderView extends StatelessWidget {
  const HeaderView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme =Theme.of(context);

    return Positioned(
      top: -22,
      child: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 58.0,
              vertical: 14,
            ),
            child: Text(
              'Perro Labrador',
              style: theme.textTheme.headline6!.copyWith(
                color: theme.colorScheme.primary,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
