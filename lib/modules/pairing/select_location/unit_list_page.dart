import 'package:flutter/material.dart';
import 'package:ft/shared_widgets/shared_app_bar.dart';

import '../../../services/locator.dart';
import 'select_location.dart';

class UnitListPage extends StatefulWidget {
  const UnitListPage({Key? key}) : super(key: key);

  @override
  State<UnitListPage> createState() => _UnitListPageState();
}

class _UnitListPageState extends State<UnitListPage> {
  final selectLocationBloc = locator.get<SelectLocationBloc>();

  @override
  Widget build(BuildContext context) {
    final units = selectLocationBloc.unitList;
    return Scaffold(
        appBar: appBarShared('Select Unit', null),
        body: FutureBuilder<dynamic>(
            future: selectLocationBloc.getUnits(context),
            builder: (context, snapshot) {
              if (units.isEmpty) {
                return const Center(
                    child: CircularProgressIndicator.adaptive());
              }
              return ListView.builder(
                  itemCount: units.length,
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, ii) {
                    final unit = units[ii];
                    return ListTile(
                      onTap: () {
                        selectLocationBloc.currentSelectedUnit = unit;
                        Navigator.pop(context);
                      },
                      title: Text(unit.UnitName),
                    );
                  });
            }));
  }
}
