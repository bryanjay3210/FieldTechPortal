import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:ft/models/technician/technician_info.dart';
import 'package:hive/hive.dart';
import '../../constants/state_const.dart';
import 'package:rxdart/rxdart.dart';

import '../../models/login/login.dart';
import '../../models/technician/technician.dart';
import '../../services/locator.dart';
import '../main/main.dart';
import '../main/main_repo.dart';
import 'login_repo.dart';
import 'package:crypto/crypto.dart' as crypto;
import 'package:convert/convert.dart';

class LoginBloc {
  //streams
  final loginState$ = BehaviorSubject<ButtonState>.seeded(ButtonState.loaded);

  final hive = Hive.box('login');
  var tech = Technician();
  var techInfo = TechnicianInfo();
  //locators
  final main = locator.get<MainBloc>();
  final loginRepo =
      (int server) => locator.get<LoginRepo>(param1: server as int, param2: '');

  generateMd5(String data) {
    var content = const Utf8Encoder().convert(data);
    var md5 = crypto.md5;
    var digest = md5.convert(content);
    return hex.encode(digest.bytes);
  }

  onLogin(Map<String, dynamic> map, BuildContext context,
      VoidCallback callback) async {
    final userName = map['username'];
    final pword =
        map['pword'] != null ? map['pword'] : generateMd5(map['password']);
    map['password'] = pword;
    final server = map['server'] as int;
    loginState$.add(ButtonState.loading);
    Map<String, dynamic> data =
        await loginRepo(server).getLoginPost(context, userName, pword);

    if (data['Status'] == 'Success') {
      final login = Login.fromJson(data);
      main.login = login;
      main.server = server;
      Map<String, dynamic> data2 = await main.getTechnicianRate(
          {'server': server, 'techId': login.UserID}, context);

      Map<String, dynamic> techInfoResult = await main.getTechnicianInfo(
          {'server': server, 'techId': login.UserID}, context);
      if (techInfoResult['Status'] == 'Success') {
        techInfo = TechnicianInfo.fromJson(
            techInfoResult['Technician'] as Map<String, dynamic>);
      }

      if (data2['Status'] == 'Success') {
        tech = Technician.fromJson(data2['Technician'] as Map<String, dynamic>);
      } else {
        Navigator.pushNamed(context, 'login');
        return;
      }

      final remember = map['rememberMe'];
      if (remember == null) {
      } else {
        if (remember) {
          saveRememberMe(
              {'username': userName, 'rememberMe': map['rememberMe']});
        } else {
          removeRememberMe();
        }
      }

      await saveLocalCredential(map);
      if (callback != null) {
        callback();
      } else {
        //
      }
    } else {}
    loginState$.add(ButtonState.loaded);
  }

  onLogout() async {
    await removeLocalCredential();
  }

  saveLocalCredential(Map<String, dynamic> val) async {
    await hive.put('cred', val);
  }

  getLocalCredential() async {
    return await hive.get('cred');
  }

  removeLocalCredential() async {
    return await hive.delete('cred');
  }

  saveRememberMe(Map<String, dynamic> val) async {
    await hive.put('remember_me', val);
  }

  getRememberMe() async {
    return await hive.get('remember_me');
  }

  removeRememberMe() async {
    return await hive.delete('remember_me');
  }

  Future<String> inputUserName() async {
    final localData = await getRememberMe();
    if (localData != null) {
      final rememberMe = localData['rememberMe'];
      if (rememberMe) return localData['username'];
    }
    return '';
  }
}
