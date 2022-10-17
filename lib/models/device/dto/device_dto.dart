import '../../gateway/gateway.dart';

class DeviceDto {
  DeviceDto(
      {required this.gateway, this.macAddress, this.deviceName, this.thingId});

  final String? macAddress;
  final Gateway gateway;
  final String? deviceName;
  final dynamic thingId;
}
