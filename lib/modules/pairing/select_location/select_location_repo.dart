import 'package:flutter/widgets.dart';

import '../../../models/building/building.dart';
import '../../../models/gateway/dto/gateway_dto.dart';
import '../../../models/gateway/gateway.dart';
import '../../../models/unit/unit.dart';
import '../../../services/api_service/api_request.dart';

class SelectLocationRepo extends RequestApi {
  SelectLocationRepo(super.server);

  dynamic getBuildings(Map<String, dynamic> map, BuildContext context) async {
    dynamic dataUrl = {
      "Command": "Building",
      "Subcommand1": "List",
      "Building": map['building']
    };
    return await getApi(dataUrl, context: context);
  }

  dynamic getUnits(Building building) async {
    dynamic url = {
      "Command": "Building",
      "Subcommand1": "UnitList",
      "BuildingID": building.BuildingID,
    };
    return await getApi(url, type: 'iot');
  }

  dynamic fetchGateway(Unit unit) async {
    dynamic url = {
      "Command": "Building",
      "Subcommand1": "FetchGateway",
      "UnitName": unit.UnitName,
    };
    return await getApi(url, type: 'iot');
  }

  dynamic postGateway(GatewayDto dto, {BuildContext? context}) async {
    dynamic url = {
      "Command": "Building",
      "Subcommand1": "AddGateway",
      "MAC": dto.macAddress,
      "BuildingID": dto.buildingId,
      "UnitName": dto.unitName
    };
    return await getApi(url, type: 'iot', context: context);
  }

  dynamic postDeleteMac(Gateway gateway) async {
    return await getApi({
      "Command": "Building",
      "Subcommand1": "RemoveGateway",
      "MAC": gateway.MacAddress,
    }, type: 'iot');
  }
}
