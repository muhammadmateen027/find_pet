import 'package:bot_toast/bot_toast.dart';
import 'package:find_pet/find_pet/find_pet.dart';
import 'package:find_pet/l10n/l10n.dart';
import 'package:find_pet/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:repository/repository.dart';

class App extends StatelessWidget {
  const App({Key? key, required this.repository}) : super(key: key);

  final RepositoryService repository;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: repository,
      child: BlocProvider<DashboardBloc>(
        create: (_) => DashboardBloc(repository: repository),
        child: MaterialApp(
          theme: ThemeData(
            accentColor: const Color(0xFF13B9FF),
            appBarTheme: const AppBarTheme(color: Color(0xFF13B9FF)),
          ),
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
          ],
          // Added builder for toast and loading indicator
          builder: EasyLoading.init(builder: BotToastInit()),
          supportedLocales: AppLocalizations.supportedLocales,
          // Set initial route name
          initialRoute: RoutesName.initial,
          //register navigator key to access in the app
          navigatorKey: navigationService.navigationKey,
          onGenerateRoute: RouteGenerator.generateRoute,
        ),
      ),
    );
  }
}
