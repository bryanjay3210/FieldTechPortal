import 'package:flutter/material.dart';
import 'package:ft/modules/home/screens/menu_card.dart';

import '../../constants/dimension_const.dart';
import '../../core/main/main.dart';
import '../../services/locator.dart';
import '../../utils/utils/theme/global_colors.dart';
import 'screens/home_screen_header.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final isDarkTheme = locator.get<MainBloc>().isDarkTheme$.value;
    return Scaffold(
        body: SingleChildScrollView(
      physics: const ClampingScrollPhysics(),
      child: Stack(
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [HomeScreenHeader(), SizedBox()],
          ),
          Column(
            children: [
              SizedBox(height: mqHeight(context) * .35),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        MenuCard(
                          text: "My Schedule",
                          menuIcon: "lib/assets/images/home/my_sched_icon.svg",
                          callback: () {
                            Navigator.pushNamed(context, 'schedule');
                          },
                          isDarkTheme: isDarkTheme,
                        ),
                        MenuCard(
                          text: "Device Pairing",
                          menuIcon:
                              "lib/assets/images/home/device_pairing_icon.svg",
                          callback: () {
                            Navigator.pushNamed(context, 'pairing');
                          },
                          isDarkTheme: isDarkTheme,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        MenuCard(
                          text: "Inventory Search",
                          menuIcon: "lib/assets/images/home/inventory_icon.svg",
                          callback: () {
                            Navigator.pushNamed(context, 'inventory');
                          },
                          isDarkTheme: isDarkTheme,
                        ),
                        MenuCard(
                          text: "Privacy Policy",
                          menuIcon: "lib/assets/images/home/privacy_icon.svg",
                          callback: () {
                            Navigator.pushNamed(context, 'policy');
                          },
                          isDarkTheme: isDarkTheme,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    ));
  }
}
