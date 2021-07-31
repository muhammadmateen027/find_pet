import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    Key? key,
    required this.onTap,
    required this.buttonText,
  }) : super(key: key);

  final VoidCallback onTap;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return MaterialButton(
      padding: const EdgeInsets.symmetric(vertical: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 1.0,
      minWidth: double.maxFinite,
      color: theme.colorScheme.background,
      onPressed: onTap,
      child: Text(
        buttonText,
        style: theme.textTheme.bodyText1!.copyWith(
          color: theme.colorScheme.onBackground,
          letterSpacing: 1,
          fontWeight: FontWeight.w400
        ),
      ),
    );
  }
}
