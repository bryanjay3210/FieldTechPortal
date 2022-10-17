import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ft/constants/state_const.dart';
import 'package:ft/core/login/login.dart';
import 'package:ft/core/main/main.dart';
import 'package:ft/modules/inventory/inventory_repo.dart';
import 'package:ft/services/locator.dart';

import 'inventory.dart';

class InventoryWarehouseList extends StatefulWidget {
  const InventoryWarehouseList({Key? key}) : super(key: key);

  @override
  State<InventoryWarehouseList> createState() => _InventoryWarehouseListState();
}

class _InventoryWarehouseListState extends State<InventoryWarehouseList> {
  @override
  void initState(){
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_){
      _loadData();
    });
  }
  _loadData() async{
    final loginBloc = locator.get<LoginBloc>();
    final mainBloc = locator.get<MainBloc>();
    final inventoryBloc = locator.get<InventoryBloc>();
    await inventoryBloc.getWareHouseList({
      'regionId' : loginBloc.techInfo.RegionID,
      'userId': mainBloc.login.UserID,
    }, context);
  }
  @override
  Widget build(BuildContext context) {
    final inventoryBloc = locator.get<InventoryBloc>();
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(onPressed: ()=> Navigator.of(context).pop(), icon: const Icon(Icons.close))
                ],
              ),
              const Text('Select Warehouse/Vehicle', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
              const SizedBox(height: 20,),
              Expanded(
                child: StreamBuilder<DataState>(
                  stream: inventoryBloc.inventoryListState$,
                  builder: (context, snapshot) {
                    if(snapshot.data == DataState.success && inventoryBloc.warehouseVehicleList.isEmpty){
                      return Center(child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [SizedBox(width:100, height: 100, child: Image.asset('lib/assets/icon/empty.png')), const SizedBox(height: 10,), const Text('No record found')],));
                    }
                    if(snapshot.data == DataState.success && inventoryBloc.warehouseVehicleList.isNotEmpty){
                      return ListView.builder(
                        itemCount: inventoryBloc.warehouseVehicleList.length,
                        itemBuilder: (context, index) {
                          var element = inventoryBloc.warehouseVehicleList[index];
                            return Column(
                              children: [
                                GestureDetector(
                                  onTap: (){
                                    inventoryBloc.selectedId = int.parse(element.ID);
                                    inventoryBloc.selectedName = element.Name;
                                    Navigator.of(context).pop();
                                  },
                                  child: SizedBox(
                                    height: 35,
                                    child: Row(
                                      children: [
                                        SvgPicture.asset(element.IsWarehouse ? 'lib/assets/icon/inventory/warehouse.svg' : 'lib/assets/icon/inventory/vehicle.svg'),
                                        const SizedBox(width: 10,),
                                        Text(element.Name)
                                      ],
                                    ),
                                  ),
                                ),
                                const Divider(thickness: 2),
                              ],
                            );
                        },
                      );
                    }
                    return const Center(child: CircularProgressIndicator.adaptive(),);
                  }
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
