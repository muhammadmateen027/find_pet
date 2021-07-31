import 'package:flutter/material.dart';
import 'package:find_pet/find_pet/global/global.dart';

import 'component/component.dart';

class PetDetail extends StatelessWidget {
  const PetDetail({Key? key, required this.imageUrl}) : super(key: key);
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.colorScheme.primary,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(imageUrl),
            fit: BoxFit.fitHeight,
          ),
        ),
        child: Column(
          children: [
            Flexible(
              flex: 1,
              child: AppBar(
                backgroundColor: Colors.transparent,
                title: const AppbarTitle(),
              ),
            ),
            Flexible(
              flex: 7,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: SingleChildScrollView(
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      const DescriptionView(),
                      const HeaderView(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
