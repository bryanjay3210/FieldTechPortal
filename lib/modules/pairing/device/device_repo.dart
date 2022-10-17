import 'package:flutter/widgets.dart';
import 'package:ft/services/api_service/api_request.dart';

import '../../../models/device/dto/device_dto.dart';
import '../../../models/gateway/gateway.dart';

class DeviceRepo extends RequestApi {
  DeviceRepo(super.server);

  dynamic getDevices(String gatewayId) async {
    dynamic url = {
      "Command": "Building",
      "Subcommand1": "DeviceList",
      "GatewayID": gatewayId
    };
    return await getApi(url, type: 'iot');
  }

  dynamic postPairDevice(DeviceDto dto, BuildContext context) async {
    return await getApi({
      "Command": "Building",
      "Subcommand1": "PairDevice",
      "GatewayID": dto.gateway.GatewayID,
      "DeviceMAC": dto.macAddress,
      "DeviceName": dto.deviceName
    }, type: 'iot');
  }

  dynamic postDeleteDevice(DeviceDto dto, BuildContext context) async {
    return await getApi({
      "Command": "Building",
      "Subcommand1": "RemoveDevice",
      "GatewayID": dto.gateway.GatewayID,
      "ThingID": dto.thingId
    }, type: 'iot');
  }

  dynamic postAutoPairDevice(Gateway gateway, BuildContext context) async {
    return await getApi({
      "Command": "Building",
      "Subcommand1": "PairDevice",
      "GatewayID": gateway.GatewayID
    }, type: 'iot');
  }
}
