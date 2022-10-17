import 'package:flutter/material.dart';
import 'package:ft/constants/state_const.dart';
import 'package:ft/modules/pairing/select_location/select_location.dart';
import 'package:ft/shared_widgets/shared_app_bar.dart';
import 'package:ft/shared_widgets/shared_dialog.dart';
import 'package:ft/utils/utils/theme/global_colors.dart';

import '../../../models/device/dto/device_dto.dart';
import '../../../services/locator.dart';
import 'device.dart';

class ListDevicePage extends StatefulWidget {
  const ListDevicePage({Key? key}) : super(key: key);

  @override
  State<ListDevicePage> createState() => _ListDevicePageState();
}

class _ListDevicePageState extends State<ListDevicePage> {
  final deviceBloc = locator.get<DeviceBloc>();
  final selectLocationBloc = locator.get<SelectLocationBloc>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      deviceBloc.getDevices();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBarShared('Devices', null),
        body: StreamBuilder(
            stream: deviceBloc.deviceState$,
            builder: (context, snapshot) {
              if (snapshot.data == null) {
                return const SizedBox();
              }

              if (snapshot.data == DataState.loading) {
                return const Center(
                  child: CircularProgressIndicator.adaptive(),
                );
              }

              if (snapshot.data == DataState.empty) {
                return const Center(
                  child: Text('No Device/s'),
                );
              }

              final devices = deviceBloc.devices;

              return ListView.builder(
                  itemCount: devices.length,
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, ii) {
                    final device = devices[ii];
                    return ListTile(
                      onTap: () async {
                        if (await showConfirmDialog(
                            context, 'Do you want to remove this device?')) {
                          deviceBloc.removeDevice(
                              DeviceDto(
                                  gateway:
                                      selectLocationBloc.currentGateway$.value,
                                  thingId: device.ThingID),
                              context);
                        }
                      },
                      leading: Icon(Icons.wifi,
                          color: device.Online == 'Provisional'
                              ? ftIconGrey
                              : Colors.green),
                      title: Text(device.Name is Map ? '- - -' : device.Name),
                      subtitle: Text(device.UUID),
                    );
                  });
            }));
  }
}
