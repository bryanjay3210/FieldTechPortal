import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ft/core/main/main.dart';
import 'package:ft/utils/utils/theme/global_colors.dart';

import '../../constants/app_info_const.dart';
import '../../core/login/login.dart';
import '../../services/locator.dart';
import '../../shared_widgets/shared_app_bar.dart';
import '../../shared_widgets/shared_dialog.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final mainBloc = locator.get<MainBloc>();
  final loginBloc = locator.get<LoginBloc>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBarShared('Settings', null),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FutureBuilder<dynamic>(
                      future: loginBloc.getLocalCredential(),
                      builder: (context, snapshot) {
                        if (snapshot.data == null) {
                          return const SizedBox();
                        }
                        return Text(
                            '     ${snapshot.data!['username'].toString()}');
                      }),
                ],
              ),
            ),
            const Divider(
              height: 3,
              thickness: 2,
            ),
            ListTile(
              title: const Text(
                'Dark Theme',
                style: TextStyle(),
              ),
              trailing: StreamBuilder<bool>(
                  stream: mainBloc.isDarkTheme$,
                  builder: (context, snapshot) {
                    if (snapshot.data == null) {
                      return const SizedBox();
                    }
                    return CupertinoSwitch(
                      trackColor: ftIconGrey,
                      activeColor: ftPrimaryColor,
                      value: snapshot.data!,
                      onChanged: (bool value) {
                        mainBloc.saveDarkModeLocalStatus(value);
                      },
                    );
                  }),
              onTap: () {},
            ),
            const Divider(
              height: 0,
              thickness: 1,
            ),
            ListTile(
              title: const Text('Logout'),
              trailing: const Icon(Icons.logout),
              onTap: () async {
                final res = await showConfirmDialog(
                    context, 'Are you sure you want to logout?');
                if (res) {
                  loginBloc.onLogout();
                  Navigator.pushReplacementNamed(context, 'login');
                }
              },
            ),
            const Divider(
              height: 0,
              thickness: 1,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, top: 8.0),
              child: Text('App Version $versionNum'),
            )
          ],
        ));
  }
}
