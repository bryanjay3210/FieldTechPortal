import 'package:flutter/widgets.dart';
import 'package:ft/modules/pairing/select_location/select_location_repo.dart';
import 'package:rxdart/subjects.dart';

import '../../../core/main/main.dart';
import '../../../models/building/building.dart';
import '../../../models/gateway/dto/gateway_dto.dart';
import '../../../models/gateway/gateway.dart';
import '../../../models/unit/unit.dart';
import '../../../services/locator.dart';
import '../../../shared_widgets/toasts.dart';

class SelectLocationBloc {
  final selectLocationRepo = (int server) =>
      locator.get<SelectLocationRepo>(param1: server, param2: '');
  final mainBloc = locator.get<MainBloc>();

  var buildingList = <Building>[];
  var unitList = <Unit>[];
  var currentSelectedBuilding = Building();
  var currentSelectedUnit = Unit();
  final test = BehaviorSubject<String>.seeded('');
  var currentGateway$ = BehaviorSubject<Gateway>();
  var onTypeMacAddress$ = BehaviorSubject<String>.seeded('');
  final isLoading$ = BehaviorSubject<bool>.seeded(false);

  Future<bool> getBuildings(BuildContext context) async {
    Map<String, dynamic> data = await selectLocationRepo(mainBloc.server)
        .getBuildings({'building': mainBloc.login.UserID}, context);
    if (data['Status'] == "Success") {
      buildingList.clear();
      data['Building'].forEach((element) {
        if (element["IOTBuilding"] != 'Y') return;
        buildingList.add(Building.fromJson(element));
      });
      return true;
    }
    return false;
  }

  getUnits(BuildContext context) async {
    unitList.clear();
    Map<String, dynamic> data = await selectLocationRepo(mainBloc.server)
        .getUnits(currentSelectedBuilding);
    if (data['Status'] == "Success") {
      unitList.clear();
      data['Units'].forEach((element) {
        unitList.add(Unit.fromJson(element));
      });
    }
  }

  gatewayByUnit(Unit unit) async {
    currentGateway$.add(Gateway(GatewayID: null));
    Map<String, dynamic> data =
        await selectLocationRepo(mainBloc.server).fetchGateway(unit);
    if (data['Status'] == 'Success') {
      final converted = Gateway.fromJson(data);
      currentGateway$.add(converted);
    } else {
      currentGateway$.add(Gateway(GatewayID: null));
    }
  }

  addGateWay(GatewayDto dto, BuildContext context) async {
    Map<String, dynamic> data = await selectLocationRepo(mainBloc.server)
        .postGateway(dto, context: context);

    Map<String, dynamic> data2 = await selectLocationRepo(mainBloc.server)
        .fetchGateway(currentSelectedUnit);
    if (data2['Status'] == "Success") {
      final converted = Gateway.fromJson(data2).copyWith();

      currentGateway$.add(converted);
    }
  }

  clearBuilding() {
    currentSelectedBuilding = Building();
    currentSelectedUnit = Unit();
    currentGateway$.add(Gateway(GatewayID: null));
  }

  removeGateWay(TextEditingController ctrler) async {
    Map<String, dynamic> data = await selectLocationRepo(mainBloc.server)
        .postDeleteMac(currentGateway$.value);
    if (data['Status'] == "Success") {
      ctrler.clear();
      onTypeMacAddress$.add('');

      currentGateway$.add(Gateway(GatewayID: ''));
      showToast('Deleting Successful');
    } else {
      showToast('Deleting Unsuccessful');
    }
  }
}
