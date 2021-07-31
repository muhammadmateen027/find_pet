import 'package:find_pet/find_pet/global/component/appbar_title.dart';
import 'package:flutter/material.dart';
import '../global/global.dart';

// Write a mixin for a stateful widget to access in the app and can be used
// rather than writing again and again.
abstract class BasePage extends StatefulWidget {
  const BasePage({Key? key}) : super(key: key);
}

abstract class BaseState<Page extends BasePage> extends State<Page> {
  Widget bottomNavigation();
}

// A mixin that will be shared in different page
mixin BasicPage<Page extends BasePage> on BaseState<Page> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.primary,
        appBar: AppBar(
          elevation: 0.0,
          centerTitle: true,
          leading: const Icon(Icons.menu),
          title: const AppbarTitle(),
          backgroundColor: Theme.of(context).colorScheme.primary,
          actions: [
            IconButton(
              onPressed: () {},
              icon: const RotationTransition(
                turns: AlwaysStoppedAnimation(310 / 360),
                child: Icon(Icons.send),
              ),
            ),
          ],
        ),
        bottomNavigationBar: bottomNavigation(),
        body: body(context),
      ),
    ).addSafeArea(backgroundColor: Theme.of(context).colorScheme.primary);
  }

  // Add body of the screen
  Widget body(BuildContext context);
}
