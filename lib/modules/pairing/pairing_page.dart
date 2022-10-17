import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ft/modules/pairing/select_location/select_location.dart';
import 'package:ft/shared_widgets/shared_app_bar.dart';
import 'package:ft/shared_widgets/shared_dialog.dart';
import 'package:ft/utils/utils/theme/global_colors.dart';

import '../../constants/dimension_const.dart';
import '../../core/main/main.dart';
import '../../models/gateway/gateway.dart';
import '../../services/locator.dart';
import 'device/device.dart';

class PairingPage extends StatefulWidget {
  const PairingPage({Key? key}) : super(key: key);

  @override
  State<PairingPage> createState() => _PairingPageState();
}

class _PairingPageState extends State<PairingPage> {
  final selectLocationBloc = locator.get<SelectLocationBloc>();
  final deviceBloc = locator.get<DeviceBloc>();
  final mainBloc = locator.get<MainBloc>();
  @override
  Widget build(BuildContext context) {
    final isDarkTheme = mainBloc.isDarkTheme$.value;
    return Scaffold(
        appBar: appBarShared('Device Pairing', null),
        body: StreamBuilder<Gateway>(
            stream: selectLocationBloc.currentGateway$,
            builder: (context, snapshot) {
              if (snapshot.data == null) {
                return initialPage(isDarkTheme);
              }

              if (snapshot.data!.GatewayID == null) {
                return initialPage(isDarkTheme);
              }

              return Stack(
                children: [
                  snapshot.data!.GatewayID.toString().isEmpty
                      ? Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: const [
                              Icon(Icons.question_mark, size: 30),
                              SizedBox(height: 30),
                              Text(
                                'This Unit has no MAC address',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        )
                      : Padding(
                          padding: const EdgeInsets.only(
                            left: 20.0,
                            right: 20,
                            bottom: 100,
                          ),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: mqHeight(context) * .20,
                                  height: mqHeight(context) * .20,
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(
                                          'lib/assets/images/device/pairing_device_img.png'),
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                ElevatedButton(
                                    style: TextButton.styleFrom(
                                        backgroundColor: Colors.green,
                                        padding: const EdgeInsets.all(15),
                                        textStyle:
                                            const TextStyle(fontSize: 18)),
                                    onPressed: () {
                                      deviceBloc.autoPairDevice(
                                          selectLocationBloc
                                              .currentGateway$.value,
                                          context);
                                    },
                                    child: Row(
                                      children: const [
                                        Icon(Icons.refresh),
                                        SizedBox(width: 10),
                                        Text('Auto')
                                      ],
                                    )),
                                const SizedBox(height: 10),
                                ElevatedButton(
                                    style: TextButton.styleFrom(
                                        backgroundColor: ftPrimaryColor,
                                        padding: const EdgeInsets.all(15),
                                        textStyle:
                                            const TextStyle(fontSize: 18)),
                                    onPressed: () {
                                      Navigator.pushNamed(
                                          context, 'pair_device');
                                    },
                                    child: Row(
                                      children: const [
                                        Icon(Icons.add),
                                        SizedBox(width: 10),
                                        Text('Device')
                                      ],
                                    )),
                                const SizedBox(height: 10),
                                ElevatedButton(
                                    style: TextButton.styleFrom(
                                        backgroundColor: Colors.red,
                                        padding: const EdgeInsets.all(15),
                                        textStyle:
                                            const TextStyle(fontSize: 18)),
                                    onPressed: () async {
                                      if (await showConfirmDialog(context,
                                          'Are you sure you want to clear building?')) {
                                        selectLocationBloc.clearBuilding();
                                      }
                                    },
                                    child: Row(
                                      children: const [
                                        Icon(Icons.close),
                                        SizedBox(width: 10),
                                        Text('Clear Building')
                                      ],
                                    )),
                                const SizedBox(
                                  height: 20,
                                ),
                                TextButton(
                                  style: TextButton.styleFrom(
                                      padding: const EdgeInsets.all(30),
                                      textStyle: const TextStyle(fontSize: 18)),
                                  onPressed: () {
                                    Navigator.pushNamed(context, 'list_device');
                                  },
                                  child: const Text(
                                    'See Device List',
                                    style: TextStyle(color: Colors.blue),
                                  ),
                                )
                              ]),
                        ),
                  Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, 'select_location');
                        },
                        child: Card(
                          child: ListTile(
                            leading: Container(
                              height: 30,
                              width: 30,
                              alignment: Alignment.centerRight,
                              child: SvgPicture.asset(
                                'lib/assets/images/device/select_location_icon.svg',
                                height: 30,
                                width: 50,
                                color: ftPrimaryColor,
                              ),
                            ),
                            contentPadding:
                                const EdgeInsets.symmetric(vertical: 10),
                            title: Text(selectLocationBloc
                                .currentSelectedBuilding.BuildingName),
                            subtitle: Text(selectLocationBloc
                                .currentSelectedUnit.UnitName),
                          ),
                        ),
                      ))
                ],
              );
            }));
  }

  Widget initialPage(bool isDarkTheme) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(vertical: mqHeight(context) * .10),
      child: StreamBuilder<Object>(
          stream: null,
          builder: (context, snapshot) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 180,
                        height: 180,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                                'lib/assets/images/device/pairing_device_img.png'),
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      locationButtonWidget(isDarkTheme)
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text('Tap to select location'),
              ],
            );
          }),
    );
  }

  Widget locationButtonWidget(bool isDarkTheme) {
    return Container(
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(130),
          color: isDarkTheme ? ftBlackContainer : ftDashboardMenuBtnColor),
      child: SizedBox(
        child: ButtonTheme(
          child: ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, 'select_location');
            },
            style: TextButton.styleFrom(
              padding: const EdgeInsets.all(0.0),
              elevation: 1,
              fixedSize: const Size.fromHeight(130),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(130),
              ),
            ),
            child: Ink(
              decoration: const ShapeDecoration(
                gradient: LinearGradient(
                  colors: <Color>[
                    Color(0xFFFFC82E),
                    Color(0xFFF87A1E),
                  ],
                ),
                shape: CircleBorder(),
              ),
              child: Container(
                height: 130,
                width: 130,
                padding: const EdgeInsets.all(20),
                child: SvgPicture.asset(
                  'lib/assets/images/device/select_location_icon.svg',
                  height: 20,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
