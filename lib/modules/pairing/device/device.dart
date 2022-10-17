import 'package:flutter/widgets.dart';
import 'package:ft/constants/state_const.dart';
import 'package:ft/modules/pairing/select_location/select_location.dart';
import 'package:rxdart/subjects.dart';

import '../../../core/main/main.dart';
import '../../../models/device/device.dart';
import '../../../models/device/dto/device_dto.dart';
import '../../../models/gateway/gateway.dart';
import '../../../services/locator.dart';
import '../../../shared_widgets/toasts.dart';
import 'device_repo.dart';

class DeviceBloc {
  final deviceRepo =
      (int server) => locator.get<DeviceRepo>(param1: server, param2: '');
  final mainBloc = locator.get<MainBloc>();
  final selectLocationBloc = locator.get<SelectLocationBloc>();
  var devices = <Device>[];
  final pairDeviceState$ = BehaviorSubject<DataState>.seeded(DataState.initial);
  final deviceState$ = BehaviorSubject<DataState>.seeded(DataState.initial);
  var qrSource = '';
  //device or gateway

  getDevices() async {
    deviceState$.add(DataState.loading);
    Map<String, dynamic> data = await deviceRepo(mainBloc.server)
        .getDevices(selectLocationBloc.currentGateway$.value.GatewayID);
    if (data['Status'] == "Success") {
      devices.clear();
      final list = <Device>[];
      if (data['Device'] == null) {
        deviceState$.add(DataState.empty);
        return;
      } else if (data['Device'] is Map) {
        list.add(Device.fromJson(data['Device']));
      } else {
        data['Device'].forEach((element) {
          list.add(Device.fromJson(element));
        });
      }
      devices = list;
      deviceState$.add(DataState.success);
    } else {
      deviceState$.add(DataState.error);
    }
  }

  addDevice(DeviceDto dto, BuildContext context) async {
    pairDeviceState$.add(DataState.loading);
    Map<String, dynamic> data =
        await deviceRepo(mainBloc.server).postPairDevice(dto, context);
    if (data['Status'] == "Success") {
      pairDeviceState$.add(DataState.success);
      showToast('New device successfully added');
    } else {
      pairDeviceState$.add(DataState.initial);
    }
  }

  removeDevice(DeviceDto dto, BuildContext context) async {
    Map<String, dynamic> data =
        await deviceRepo(mainBloc.server).postDeleteDevice(dto, context);
    if (data['Status'] == "Success") {
      devices.removeWhere((element) => element.ThingID == dto.thingId);
      deviceState$.add(DataState.success);
    } else {
      pairDeviceState$.add(DataState.initial);
    }
  }

  autoPairDevice(Gateway gateway, BuildContext context) async {
    pairDeviceState$.add(DataState.loading);
    Map<String, dynamic> data =
        await deviceRepo(mainBloc.server).postAutoPairDevice(gateway, context);
    if (data['Status'] == "Success") {
      pairDeviceState$.add(DataState.success);
    } else {
      pairDeviceState$.add(DataState.initial);
    }
  }
}
