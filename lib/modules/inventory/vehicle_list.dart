import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ft/constants/state_const.dart';
import 'package:ft/core/login/login.dart';
import 'package:ft/core/main/main.dart';
import 'package:ft/modules/inventory/inventory.dart';
import 'package:ft/services/locator.dart';

class VehicleList extends StatefulWidget {
  const VehicleList({Key? key}) : super(key: key);

  @override
  State<VehicleList> createState() => _VehicleListState();
}

class _VehicleListState extends State<VehicleList> {
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
    await inventoryBloc.getVehicleList({
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
              const Text('Select Vehicle', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
              const SizedBox(height: 20,),
              Expanded(
                child: StreamBuilder<DataState>(
                    stream: inventoryBloc.inventoryListState$,
                    builder: (context, snapshot) {
                      if(snapshot.data == DataState.success && inventoryBloc.vehicleList.isEmpty){
                        return Center(child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [SizedBox(width:100, height: 100, child: Image.asset('lib/assets/icon/empty.png')), const SizedBox(height: 10,), const Text('No record found')],));
                      }
                      if(snapshot.data == DataState.success && inventoryBloc.vehicleList.isNotEmpty){
                        return ListView.builder(
                          itemCount: inventoryBloc.vehicleList.length,
                          itemBuilder: (context, index) {
                            var element = inventoryBloc.vehicleList[index];
                            return Column(
                              children: [
                                GestureDetector(
                                  onTap: (){
                                    inventoryBloc.selectedId = int.parse(element.VehicleID);
                                    inventoryBloc.selectedVehicle = element.VehicleName;
                                    Navigator.of(context).pop();
                                  },
                                  child: SizedBox(
                                    height: 35,
                                    child: Row(
                                      children: [
                                        SvgPicture.asset('lib/assets/icon/inventory/vehicle.svg'),
                                        const SizedBox(width: 10,),
                                        Text(element.VehicleName)
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
