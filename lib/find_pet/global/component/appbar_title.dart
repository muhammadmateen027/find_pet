import 'package:flutter/material.dart';

class AppbarTitle extends StatelessWidget {
  const AppbarTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text('Find my '),
        Stack(
          children: <Widget>[
            // Stroked text as border.
            Text(
              'pet',
              style:
              Theme.of(context).textTheme.bodyText2!.copyWith(
                  fontSize: 20,
                  foreground: Paint()
                    ..style = PaintingStyle.stroke
                    ..strokeWidth = 1
                    ..color = Colors.white),
            ),
            // Solid text as fill.
            Text(
              'pet',
              style: Theme.of(context)
                  .textTheme
                  .bodyText2!
                  .copyWith(
                fontSize: 20,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ],
        )
      ],
    );
  }
}
