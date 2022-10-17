import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/widgets.dart';
import 'package:hive/hive.dart';
import 'package:rxdart/subjects.dart';

import '../../models/login/login.dart';
import '../../services/locator.dart';
import 'main_repo.dart';

class MainBloc {
  final _main =
      (int server) => locator.get<MainRepo>(param1: server as int, param2: '');
  final hive = Hive.box('main');

  var login = Login();
  var techRate = 0;
  var server = 0;
  final bottomNavSelected$ = BehaviorSubject<int>.seeded(0);
  final isDarkTheme$ = BehaviorSubject<bool>.seeded(false);

  checkConnectivity(VoidCallback callback) {
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      if ((result.index != 4 || result.index != 0)) {
        callback();
      }
    });
  }

  Future<Map<String, dynamic>> getTechnicianRate(
      Map<String, dynamic> map, BuildContext context) async {
    return await _main(map['server']).getTechnicianRate(map, context);
  }

  Future<Map<String, dynamic>> getTechnicianInfo(
      Map<String, dynamic> map, BuildContext context) async {
    return await _main(map['server']).getTechnician(map, context);
  }

  checkDarkModeLocal() async {
    isDarkTheme$.add(await getDarkModeLocalStatus() ?? false);
  }

  getDarkModeLocalStatus() async {
    return await hive.get('dark_mode');
  }

  saveDarkModeLocalStatus(dynamic val) async {
    isDarkTheme$.add(val);
    await hive.put('dark_mode', val);
  }
}
