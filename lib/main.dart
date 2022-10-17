import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

import 'core/main/main.dart';
import 'services/locator.dart';
import 'services/routes.dart';
import 'utils/utils/theme/global_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (!kIsWeb) {
    final dir = await getApplicationDocumentsDirectory();
    Hive.init(dir.path);
  }
  await SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
      overlays: [SystemUiOverlay.bottom, SystemUiOverlay.top]);
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  locatorSetup();
  await Hive.openBox('main');
  await Hive.openBox('login');
  await Hive.openBox('service_call');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mainBloc = locator.get<MainBloc>();
    final GlobalKey mainKey = GlobalKey();
    mainBloc.checkDarkModeLocal();
    return StreamBuilder<bool>(
        stream: mainBloc.isDarkTheme$,
        builder: (context, snapshot) {
          if (snapshot.data == null) {
            return const SizedBox();
          }
          return MaterialApp(
            // title: 'Field',
            debugShowCheckedModeBanner: false,
            key: mainKey,
            theme: snapshot.data!
                ? GlobalTheme.darkTheme()
                : GlobalTheme.lightTheme(),
            initialRoute: '/',
            routes: routes(),
          );
        });
  }
}
