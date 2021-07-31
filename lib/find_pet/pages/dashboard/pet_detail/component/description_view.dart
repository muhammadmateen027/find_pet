import 'package:flutter/material.dart';
import 'package:find_pet/find_pet/global/global.dart';

import 'component.dart';

class DescriptionView extends StatelessWidget {
  const DescriptionView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      children: [
        const SizedBox(height: 36),
        const TypeView(),
        const SizedBox(height: 30),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Ubicacion: Pocitos',
            style: theme.textTheme.bodyText1!.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Text(
          'Lorem ipsum dolor sit amet, consectetur adipisc ing elit,'
          'sed do eius mod tempor incidid unt ut la bore et dolore magna aliqua'
          'Lorem ipsum dolor sit amet, consectetur adipisc ing elit,',
          style: theme.textTheme.bodyText2,
          textAlign: TextAlign.justify,
        ),
        const SizedBox(height: 20),
        AppButton(buttonText: 'Contractor', onTap: () {}),
      ],
    ).detailViewBorder();
  }
}
