import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ft/core/login/login.dart';
import 'package:ft/core/main/main.dart';
import 'package:ft/modules/inventory/inventory_search.dart';
import 'package:ft/modules/inventory/inventory_warehouse.dart';
import 'package:ft/services/locator.dart';
import 'package:ft/shared_widgets/shared_app_bar.dart';
import 'package:ft/shared_widgets/shared_button.dart';
import 'package:ft/shared_widgets/shared_text_field.dart';
import 'package:ft/utils/utils/theme/global_colors.dart';

import 'inventory.dart';

class InventoryPage extends StatefulWidget {
  const InventoryPage({Key? key}) : super(key: key);

  @override
  State<InventoryPage> createState() => _InventoryPageState();
}

class _InventoryPageState extends State<InventoryPage> {
  final partNumberCtrl = TextEditingController();
  final partNameCtrl = TextEditingController();

  @override
  void initState() {
    final inventoryBloc = locator.get<InventoryBloc>();
    inventoryBloc.selectedName = '';
    inventoryBloc.selectedId = null;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final inventoryBloc = locator.get<InventoryBloc>();
    final loginBloc = locator.get<LoginBloc>();
    final mainBloc = locator.get<MainBloc>();
    final isDarkTheme = mainBloc.isDarkTheme$.value;
    return Scaffold(
      appBar: appBarShared('Inventory Search', null),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            const Text('Warehouse',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                    color: isDarkTheme ? ftGreyDark : const Color(0xFFF2F2F2),
                    borderRadius: BorderRadius.circular(10)),
                child: TextField(
                  onTap: () => Navigator.of(context)
                      .push(MaterialPageRoute(
                        builder: (context) => const InventoryWarehouseList(),
                      ))
                      .then((value) => setState(() {})),
                  readOnly: true,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: inventoryBloc.selectedName == ''
                          ? 'Search Warehouse/Vehicle'
                          : inventoryBloc.selectedName),
                )),
            const SizedBox(height: 10),
            const Text('Part Number',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                    color: isDarkTheme ? ftGreyDark : const Color(0xFFF2F2F2),
                    borderRadius: BorderRadius.circular(10)),
                child: TextField(
                  controller: partNumberCtrl,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      border: InputBorder.none, hintText: 'Part Number'),
                )),
            const SizedBox(height: 10),
            const Text('Part Name',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                    color: isDarkTheme ? ftGreyDark : const Color(0xFFF2F2F2),
                    borderRadius: BorderRadius.circular(10)),
                child: TextField(
                  controller: partNameCtrl,
                  decoration: const InputDecoration(
                      border: InputBorder.none, hintText: 'Part Name'),
                )),
            const SizedBox(height: 20),
            StretchableButton(
                text: 'Search Product',
                onPressed: () async {
                  await inventoryBloc.searchProduct({
                    'regionId': loginBloc.techInfo.RegionID,
                    'warehouse': inventoryBloc.selectedId,
                    'partNumber': partNumberCtrl.text,
                    'partName': partNameCtrl.text,
                    'userId': mainBloc.login.UserID,
                  }, context);
                  if (inventoryBloc.inventorySearch.isEmpty) return;
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const InventorySearch(),
                  ));
                }),
          ],
        ),
      ),
    );
  }
}
