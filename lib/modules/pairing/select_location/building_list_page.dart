import 'package:flutter/material.dart';
import 'package:ft/shared_widgets/shared_app_bar.dart';

import '../../../services/locator.dart';
import 'select_location.dart';

class BuildingListPage extends StatefulWidget {
  const BuildingListPage({Key? key}) : super(key: key);

  @override
  State<BuildingListPage> createState() => _BuildingListPageState();
}

class _BuildingListPageState extends State<BuildingListPage> {
  final selectLocationBloc = locator.get<SelectLocationBloc>();

  @override
  Widget build(BuildContext context) {
    final buildings = selectLocationBloc.buildingList;
    return Scaffold(
        appBar: appBarShared('Select Building', null),
        body: ListView.builder(
            itemCount: buildings.length,
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, ii) {
              final building = buildings[ii];
              return ListTile(
                onTap: () {
                  selectLocationBloc.currentSelectedBuilding = building;
                  Navigator.pop(context);
                },
                title: Text(building.BuildingName),
              );
            }));
  }
}
