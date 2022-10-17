import 'package:flutter/material.dart';
import 'package:ft/models/device/dto/device_dto.dart';
import 'package:ft/modules/pairing/select_location/select_location.dart';
import 'package:ft/modules/schedule/shared_widget/actions_button.dart';
import 'package:ft/shared_widgets/shared_app_bar.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import '../../../constants/state_const.dart';
import '../../../services/locator.dart';
import '../../../shared_widgets/toasts.dart';
import '../../../utils/utils/theme/global_colors.dart';
import '../qr/qr.dart';
import 'device.dart';

class PairDevicePage extends StatefulWidget {
  const PairDevicePage({Key? key}) : super(key: key);

  @override
  State<PairDevicePage> createState() => _PairDevicePageState();
}

class _PairDevicePageState extends State<PairDevicePage> {
  final deviceBloc = locator.get<DeviceBloc>();
  final selectLocationBloc = locator.get<SelectLocationBloc>();
  final qrBloc = locator.get<QrBloc>();

  final deviceNameCtrler = TextEditingController();
  final macAddressCtrler = TextEditingController();
  final maskFormatter = MaskTextInputFormatter(
      mask: "################", filter: {"#": RegExp('[a-f-A-F0-9]')});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBarShared('Pair New Device', null),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Device Name',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: ftTextBlack)),
                  TextFormField(
                      controller: deviceNameCtrler,
                      decoration: const InputDecoration(
                        hintText: 'e.g. Thermostat...',
                      ),
                      validator: (val) {
                        if (val == null) {
                          return 'Building required';
                        }
                        return null;
                      },
                      autovalidateMode: AutovalidateMode.always,
                      onChanged: (str) {}),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Zigbee MAC Address',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: ftTextBlack)),
                  TextFormField(
                      inputFormatters: [maskFormatter],
                      controller: macAddressCtrler,
                      decoration: InputDecoration(
                        hintText: 'e.g. ABCDEF1234567890...',
                        suffixIcon: IconButton(
                          icon:
                              const Icon(Icons.qr_code, color: ftPrimaryColor),
                          onPressed: () async {
                            await Navigator.pushNamed(context, 'qr');
                            macAddressCtrler.text = qrBloc.qrCode;
                          },
                        ),
                      ),
                      validator: (val) {
                        if (val == null) {
                          return 'Mac address required';
                        }
                        return null;
                      },
                      autovalidateMode: AutovalidateMode.always,
                      onChanged: (str) {}),
                ],
              ),
              const SizedBox(height: 35),
              StreamBuilder<DataState>(
                  stream: deviceBloc.pairDeviceState$,
                  builder: (context, snapshot) {
                    if (snapshot.data == null) {
                      return const SizedBox();
                    }

                    if (snapshot.data == DataState.loading) {
                      return const Center(
                        child: CircularProgressIndicator.adaptive(),
                      );
                    }

                    return ActionButtons(
                        text: 'Pair New Device',
                        isEnable: true,
                        callback: () async {
                          if (deviceNameCtrler.text.trim().isEmpty ||
                              macAddressCtrler.text.trim().isEmpty) {
                            showToast('Please fill up all fields');
                            return;
                          }

                          await deviceBloc.addDevice(
                              DeviceDto(
                                  gateway:
                                      selectLocationBloc.currentGateway$.value,
                                  deviceName: deviceNameCtrler.text,
                                  macAddress: macAddressCtrler.text),
                              context);
                        });
                  })
            ],
          ),
        ));
  }
}
