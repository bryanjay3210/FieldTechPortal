import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ft/modules/schedule/schedule_page.dart';
import 'package:ft/utils/utils/theme/global_colors.dart';
import 'package:rxdart/subjects.dart';

import '../../modules/home/home.dart';
import '../../modules/settings/settings.dart';
import '../../services/locator.dart';
import '../../shared_widgets/shared_widget.dart';
import '../../utils/utils/image/svg_icon.dart';
import '../login/login.dart';
import 'loading_screen.dart';
import 'main.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final mainBloc = locator.get<MainBloc>();
  final loginBloc = locator.get<LoginBloc>();
  final loading$ = BehaviorSubject<bool>.seeded(true);

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final data = await loginBloc.getLocalCredential();

      void refresh() async {
        if (data != null) {
          loading$.add(true);
          await loginBloc.onLogin({
            'username': data['username'],
            'pword': data['password'],
            'server': mainBloc.server,
          }, context, () async {
            loading$.add(false);
          });
        } else {
          Navigator.pushReplacementNamed(context, 'login');
        }
      }

      if (kIsWeb) {
        refresh();
      } else {
        refresh();
        mainBloc.checkConnectivity(() async {
          refresh();
        });
      }
    });
  }

  static final List<Widget> _widgetOptions = <Widget>[
    const HomePage(),
    const SchedulePage(),
    const SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    final navSelected = locator.get<MainBloc>().bottomNavSelected$;

    return Scaffold(
      body: StreamBuilder<bool>(
          stream: loading$,
          builder: (context, snapshot) {
            if (snapshot.data == null) {
              return const LoadingScreen();
            }

            if (snapshot.data!) {
              return const LoadingScreen();
            }
            return SizedBox(
              child: StreamBuilder<int>(
                  stream: navSelected.stream,
                  builder: (context, snapshot) {
                    if (snapshot.data == null) {
                      return const LoadingScreen();
                    }
                    final selected = snapshot.data;
                    return Scaffold(
                      bottomNavigationBar: Theme(
                        data: ThemeData(
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                        ),
                        child: StreamBuilder<bool>(
                            stream: mainBloc.isDarkTheme$,
                            builder: (context, snapshot) {
                              if (snapshot.data == null) {
                                return const SizedBox();
                              }
                              return BottomNavigationBar(
                                backgroundColor:
                                    snapshot.data! ? ftGreyDark100 : ftWhite,
                                showSelectedLabels: false,
                                showUnselectedLabels: false,
                                selectedFontSize: 0,
                                unselectedFontSize: 0,
                                type: BottomNavigationBarType.fixed,
                                elevation: 20,
                                items: <BottomNavigationBarItem>[
                                  BottomNavigationBarItem(
                                    icon: badge('home/home_icon', 'Home',
                                        0 == selected, snapshot.data!),
                                    label: 'test',
                                  ),
                                  BottomNavigationBarItem(
                                    backgroundColor: Colors.white,
                                    icon: badge('home/schedule_icon',
                                        'My Schedule', false, snapshot.data!),
                                    label: '',
                                  ),
                                  BottomNavigationBarItem(
                                    icon: badge('home/setting_icon', 'Others',
                                        2 == selected, snapshot.data!),
                                    label: '',
                                  ),
                                ],
                                currentIndex: navSelected.value,
                                unselectedItemColor: Colors.grey,
                                onTap: (idx) {
                                  if (idx == 1) {
                                    return;
                                  }
                                  mainBloc.bottomNavSelected$.add(idx);
                                },
                              );
                            }),
                      ),
                      body: Center(
                        child: _widgetOptions.elementAt(navSelected.value),
                      ),
                      floatingActionButton: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: FloatingActionButton(
                          child: svgIcon('home/schedule_icon',
                              height: 18, color: Colors.white),
                          backgroundColor: ftPrimaryColor,
                          heroTag: 'scheduleTag',
                          onPressed: () {
                            Navigator.pushNamed(context, 'schedule');
                          },
                        ),
                      ),
                      floatingActionButtonLocation:
                          FloatingActionButtonLocation.centerDocked,
                    );
                  }),
            );
          }),
    );
  }
}
