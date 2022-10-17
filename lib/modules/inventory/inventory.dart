import 'package:flutter/material.dart';
import 'package:ft/constants/state_const.dart';
import 'package:ft/core/main/main.dart';
import 'package:ft/models/inventory/inventory_customer.dart';
import 'package:ft/models/inventory/inventory_search.dart';
import 'package:ft/models/inventory/list_in_location.dart';
import 'package:ft/models/inventory/list_in_location_class.dart';
import 'package:ft/models/inventory/vehicle.dart';
import 'package:ft/models/inventory/warehouse.dart';
import 'package:ft/models/inventory/warehouse_vehicle.dart';
import 'package:ft/services/locator.dart';
import 'package:rxdart/rxdart.dart';

import 'inventory_repo.dart';

class InventoryBloc{
  final _inventoryRepo =
      (int server) => locator.get<InventoryRepo>(param1: server, param2: '');
  final mainBloc = locator.get<MainBloc>();
  final inventoryListState$ = BehaviorSubject<DataState>.seeded(DataState.initial);
  var inventorySearch = <InventorySearch>[];
  var warehouseList = <Warehouse>[];
  var vehicleList = <Vehicle>[];
  var warehouseVehicleList = <WarehouseVehicle>[];
  var listInLocation = <ListInLocation>[];
  var listInLocationClass = <ListInLocationClass>[];
  var customerList = <InventoryCustomer>[];
  bool isLoading = false;

  int? selectedId;
  int? selectedVehicleId;
  int? selectedCustomerId;
  String selectedName = '';
  String selectedVehicle = '';
  String selectedCustomer = '';


  getWareHouseList(Map<String, dynamic> map, BuildContext context) async {
    inventoryListState$.add(DataState.loading);
    warehouseVehicleList = [];
    vehicleList = [];
    warehouseList = [];
    Map<String, dynamic> data = await _inventoryRepo(mainBloc.server).getWarehouseList(context, map);
    if(data['Status'] == 'Success'){
      try{
        data['Warehouse'].forEach((element) {
          warehouseList.add(Warehouse.fromJson(element));
        });
        data['Vehicle'].forEach((element) {
          vehicleList.add(Vehicle.fromJson(element));
        });
      }
      catch(e){
        inventoryListState$.add(DataState.success);
      }
    }
    warehouseList.sort((a, b) => a.WarehouseName.compareTo(b.WarehouseName),);
    vehicleList.sort((a, b) => a.VehicleName.compareTo(b.VehicleName),);
    for (var element in warehouseList) { warehouseVehicleList.add(WarehouseVehicle(ID: element.WarehouseID, Name: element.WarehouseName, IsWarehouse: true)); }
    for (var element in vehicleList) { warehouseVehicleList.add(WarehouseVehicle(ID: element.VehicleID, Name: element.VehicleName, IsWarehouse: false)); }
    inventoryListState$.add(DataState.success);
  }

  searchProduct(Map<String, dynamic> map, BuildContext context) async {
    inventorySearch = [];
    inventoryListState$.add(DataState.loading);
    Map<String, dynamic> data = await _inventoryRepo(mainBloc.server).searchProduct(context, map);
    if(data['Status'] == 'Success'){
      try{
        var products = data['Products'];
        for(var ds in products){
          var prod = ds as Map<String, dynamic>;
          if(prod.keys.contains('Locations')){
            inventorySearch.add(InventorySearch(productID: prod['ProductID'], productName: prod['ProductName'], locations:  prod['Locations']));
          }
        }
      }
      catch(e){
        inventoryListState$.add(DataState.success);
      }
    }
    inventoryListState$.add(DataState.success);
  }

  getListInLocation(Map<String, dynamic> map, BuildContext context) async {
    listInLocation = [];
    listInLocationClass = [];
    inventoryListState$.add(DataState.loading);
    Map<String, dynamic> data = await _inventoryRepo(mainBloc.server).getListInLocation(context, map);
    if(data['Status'] == 'Success'){
      try{
        data['Items'].forEach((element) {
          listInLocation.add(ListInLocation.fromJson(element));
          listInLocationClass.add(ListInLocationClass(int.parse(element["ItemID"]), int.parse(element['Quantity']), false));
        });
      }
      catch(e){
        inventoryListState$.add(DataState.success);
      }
    }
    inventoryListState$.add(DataState.success);
  }

  getVehicleList(Map<String, dynamic> map, BuildContext context) async {
    vehicleList = [];
    inventoryListState$.add(DataState.loading);
    Map<String, dynamic> data = await _inventoryRepo(mainBloc.server).getVehicleList(context, map);
    if(data['Status'] == 'Success'){
      try{
        data['Vehicles'].forEach((element) {
          vehicleList.add(Vehicle.fromJson(element));
        });
      }
      catch(e){
        inventoryListState$.add(DataState.success);
      }
    }
    inventoryListState$.add(DataState.success);
  }

  getCustomerList(Map<String, dynamic> map, BuildContext context) async {
    customerList = [];
    inventoryListState$.add(DataState.loading);
    isLoading = true;
    Map<String, dynamic> data = await _inventoryRepo(mainBloc.server).getCustomerList(context, map);
    if(data['Status'] == 'Success'){
      try{
        data['Customers'].forEach((element) {
          customerList.add(InventoryCustomer.fromJson(element));
        });
      }
     catch(e){
       inventoryListState$.add(DataState.success);
     }
    }
    inventoryListState$.add(DataState.success);
    isLoading = false;
  }

  submitByVehicle(Map<String, dynamic> map, BuildContext context) async{
    inventoryListState$.add(DataState.loading);
    Map<String, dynamic> data = await _inventoryRepo(mainBloc.server).submitByVehicle(context, map);
    if(data['Status'] == 'Success'){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("${data['Status']}!"),
      ));
      Navigator.of(context).pop();
      Navigator.of(context).pop();
      Navigator.of(context).pop();
      Navigator.of(context).pop();
    }
    inventoryListState$.add(DataState.success);
  }

  submitByWarehouse(Map<String, dynamic> map, BuildContext context) async{
    inventoryListState$.add(DataState.loading);
    Map<String, dynamic> data = await _inventoryRepo(mainBloc.server).submitByWarehouse(context, map);
    if(data['Status'] == 'Success'){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("${data['Status']}!"),
      ));
      Navigator.of(context).pop();
      Navigator.of(context).pop();
      Navigator.of(context).pop();
      Navigator.of(context).pop();
    }
    inventoryListState$.add(DataState.success);
  }

  submitByScrap(Map<String, dynamic> map, BuildContext context) async{
    inventoryListState$.add(DataState.loading);
    Map<String, dynamic> data = await _inventoryRepo(mainBloc.server).submitByScrap(context, map);
    if(data['Status'] == 'Success'){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("${data['Status']}!"),
      ));
      Navigator.of(context).pop();
      Navigator.of(context).pop();
      Navigator.of(context).pop();
      Navigator.of(context).pop();
    }
    inventoryListState$.add(DataState.success);
  }

  submitByCustomer(Map<String, dynamic> map, BuildContext context) async{
    inventoryListState$.add(DataState.loading);
    Map<String, dynamic> data = await _inventoryRepo(mainBloc.server).submitByCustomer(context, map);
    if(data['Status'] == 'Success'){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("${data['Status']}!"),
      ));
      Navigator.of(context).pop();
      Navigator.of(context).pop();
      Navigator.of(context).pop();
      Navigator.of(context).pop();
    }
    inventoryListState$.add(DataState.success);
  }

}