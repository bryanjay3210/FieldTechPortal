import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ft/core/login/login.dart';
import 'package:ft/core/main/main.dart';
import 'package:ft/services/locator.dart';
import 'package:hive/hive.dart';
import 'package:mockito/mockito.dart';
import 'package:path_provider/path_provider.dart';

class MockBuildContext extends Mock implements BuildContext {}

void main() async {
  final dir = await getApplicationDocumentsDirectory();
  WidgetsFlutterBinding.ensureInitialized();
  Hive.init(dir.path);
  await Hive.openBox('login');
  locatorSetup();
  LoginBloc login;
  MainBloc main;

  group('Login Test --', () {
    login = locator.get<LoginBloc>();
    main = locator.get<MainBloc>();
    final context = MockBuildContext();

    test('onLogin', () async {
      await login.onLogin({
        'username': 'johnsons@test.com',
        'password': 'Password@123!',
        'server': 0
      }, context, () {});
      expect(main.login.Status != null, true);
    });

    // test('User', () async {
    //   final res = await schedService.getService();
    //   expect(json.encode(res) != null, true);
    // });
  });
}
