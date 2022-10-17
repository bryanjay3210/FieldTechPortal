import 'package:flutter/material.dart';
import 'package:ft/services/api_service/api_request.dart';

class InventoryRepo extends RequestApi{
  InventoryRepo(super.server);

  dynamic getWarehouseList(
      BuildContext context, Map<String, dynamic> map) async {
    dynamic dataUrl = {
      "Command":"Warehouse",
      "Subcommand1":"List",
      "RegionID": map['regionId'],
      "WithVehicle": "Y",
      'LoggedUser': map['userId'],
    };
    return await getApi(dataUrl, context: context);
  }

  dynamic searchProduct(
      BuildContext context, Map<String, dynamic> map) async {
    dynamic dataUrl = {
      "Command":"InventoryItem",
      "Subcommand1":"Search",
      "RegionID": map['regionId'],
      "Warehouse": map['warehouse'],
      "PartNumber": map['partNumber'],
      "PartName": map['partName'],
      'LoggedUser': map['userId'],
    };
    return await getApi(dataUrl, context: context);
  }

  dynamic getListInLocation(
      BuildContext context, Map<String, dynamic> map) async {
    dynamic dataUrl = {
      "Command":"InventoryItem",
      "Subcommand1":"ListInLocation",
      "ProductID": map['productId'],
      "LocationID": map['locationId'],
      "VehicleID": map['vehicleId'],
      'LoggedUser': map['userId'],
    };
    return await getApi(dataUrl, context: context);
  }

  dynamic getVehicleList(
      BuildContext context, Map<String, dynamic> map) async {
    dynamic dataUrl = {
      "Command":"Inventory",
      "Subcommand1":"Vehicle",
      "Subcommand2":"List",
      "RegionID": map['regionId'],
      'LoggedUser': map['userId'],
    };
    return await getApi(dataUrl, context: context);
  }

  dynamic getCustomerList(
      BuildContext context, Map<String, dynamic> map) async {
    dynamic dataUrl = {
      "Command":"CSR",
      "Subcommand1":"Search",
      "Fname": map['fname'],
      "Lname": map['lname'],
      "AccountNum": map['accountNum'],
      'LoggedUser': map['userId'],
    };
    return await getApi(dataUrl, context: context);
  }

  dynamic submitByShelf(
      BuildContext context, Map<String, dynamic> map) async {
    dynamic dataUrl = {
      "Command":"InventoryItem",
      "Subcommand1":"DoTransfer",
      "Subcommand2":"SS",
      "TechID": map['techId'],
      "Items": map['items'],
      "NewLocation": map['shelfId'],
      'LoggedUser': map['userId'],
    };
    return await getApi(dataUrl, context: context);
  }

  dynamic submitByVehicle(
      BuildContext context, Map<String, dynamic> map) async {
    dynamic dataUrl = {
      "Command":"InventoryItem",
      "Subcommand1":"DoTransfer",
      "Subcommand2":"WV",
      "TechID": map['techId'],
      "Items": map['items'],
      "NewVeh": map['vehicleId'],
      'LoggedUser': map['userId'],
    };
    return await getApi(dataUrl, context: context);
  }

  dynamic submitByWarehouse(
      BuildContext context, Map<String, dynamic> map) async {
    dynamic dataUrl = {
      "Command":"InventoryItem",
      "Subcommand1":"DoTransfer",
      "Subcommand2":"WW",
      "TechID": map['techId'],
      "Items": map['items'],
      "NewVeh": {'Tracking': map['tracking'], 'Carrier': map['carrier']},
      'LoggedUser': map['userId'],
    };
    return await getApi(dataUrl, context: context);
  }

  dynamic submitByScrap(
      BuildContext context, Map<String, dynamic> map) async {
    dynamic dataUrl = {
      "Command":"InventoryItem",
      "Subcommand1":"DoTransfer",
      "Subcommand2":"WS",
      "TechID": map['techId'],
      "Items": map['items'],
      "ScrapReason": map['scrapReason'],
      'LoggedUser': map['userId'],
    };
    return await getApi(dataUrl, context: context);
  }

  dynamic submitByCustomer(
      BuildContext context, Map<String, dynamic> map) async {
    dynamic dataUrl = {
      "Command":"InventoryItem",
      "Subcommand1":"DoTransfer",
      "Subcommand2":"VC",
      "TechID": map['techId'],
      "Items": map['items'],
      "NewCust": map['customerId'],
      'LoggedUser': map['userId'],
    };
    return await getApi(dataUrl, context: context);
  }

}