import 'package:find_pet/config/config.dart';
import 'package:find_pet/find_pet/find_pet.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:find_pet/app/app.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('App', () {
    testWidgets('renders DashboardPage', (tester) async {
      var repository = await Initialization.init();

      await tester.pumpWidget(App(repository: repository));
      expect(find.byType(DashboardPage), findsOneWidget);
    });
  });
}
