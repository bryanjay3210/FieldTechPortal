import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:ft/core/login/login.dart';
import 'package:ft/core/main/main.dart';
import 'package:ft/models/inventory/list_in_location.dart';
import 'package:ft/models/inventory/list_in_location_class.dart';
import 'package:ft/modules/inventory/inventory.dart';
import 'package:ft/modules/inventory/vehicle_list.dart';
import 'package:ft/services/locator.dart';
import 'package:ft/shared_widgets/shared_app_bar.dart';
import 'package:ft/shared_widgets/shared_button.dart';
import 'package:ft/utils/utils/theme/global_colors.dart';

import 'customer.dart';

class CompleteTransfer extends StatefulWidget {
  const CompleteTransfer({Key? key}) : super(key: key);

  @override
  State<CompleteTransfer> createState() => _CompleteTransferState();
}

class _CompleteTransferState extends State<CompleteTransfer> {
  List items = [];
  String radioValue = 'Vehicle';
  final inventoryBloc = locator.get<InventoryBloc>();
  final mainBloc = locator.get<MainBloc>();
  final loginBloc = locator.get<LoginBloc>();
  TextEditingController carrierCtrl = TextEditingController();
  TextEditingController trackingCtrl = TextEditingController();
  TextEditingController scrapCtrl = TextEditingController();
  TextEditingController acctNumberCtrl = TextEditingController();
  TextEditingController customerLastNameCtrl = TextEditingController();
  TextEditingController customerFirstNameCtrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final isDarkTheme = mainBloc.isDarkTheme$.value;
    return Scaffold(
      appBar: appBarShared('Complete Transaction', null),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Expanded(
                child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Transfer Destination',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20)),
                        const SizedBox(
                          height: 10,
                        ),
                        radioButton('Vehicle', 'Vehicle'),
                        radioButton('Warehouse', 'Warehouse'),
                        radioButton('Scrap', 'Scrap'),
                        radioButton('Customer', 'Customer'),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Divider(
                    thickness: 2,
                    indent: 10,
                    endIndent: 10,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  StatefulBuilder(
                    builder: (context, setState) {
                      if (radioValue == 'Warehouse') {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Carrier',
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.bold)),
                            const SizedBox(height: 10),
                            Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                decoration: BoxDecoration(
                                    color: const Color(0xFFF2F2F2),
                                    borderRadius: BorderRadius.circular(10)),
                                child: TextField(
                                  controller: carrierCtrl,
                                  decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      hintText: 'Enter Carrier'),
                                )),
                            const SizedBox(height: 10),
                            const Text('Tracking',
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.bold)),
                            const SizedBox(height: 10),
                            Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                decoration: BoxDecoration(
                                    color: const Color(0xFFF2F2F2),
                                    borderRadius: BorderRadius.circular(10)),
                                child: TextField(
                                  controller: trackingCtrl,
                                  decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      hintText: 'Enter Tracking'),
                                )),
                          ],
                        );
                      }
                      if (radioValue == 'Scrap') {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Scrap',
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.bold)),
                            const SizedBox(height: 10),
                            Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                decoration: BoxDecoration(
                                    color: const Color(0xFFF2F2F2),
                                    borderRadius: BorderRadius.circular(10)),
                                child: TextField(
                                  controller: scrapCtrl,
                                  decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      hintText: 'Enter Reason For Scrapping'),
                                )),
                          ],
                        );
                      }
                      if (radioValue == 'Customer') {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Customer Account Number',
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.bold)),
                            const SizedBox(height: 10),
                            Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                decoration: BoxDecoration(
                                    color: const Color(0xFFF2F2F2),
                                    borderRadius: BorderRadius.circular(10)),
                                child: TextField(
                                  controller: acctNumberCtrl,
                                  decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      hintText: 'Enter Account Number'),
                                )),
                            const SizedBox(height: 10),
                            const Text('Customer First Name',
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.bold)),
                            const SizedBox(height: 10),
                            Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                decoration: BoxDecoration(
                                    color: const Color(0xFFF2F2F2),
                                    borderRadius: BorderRadius.circular(10)),
                                child: TextField(
                                  controller: customerFirstNameCtrl,
                                  decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      hintText: 'Enter First Name'),
                                )),
                            const SizedBox(height: 10),
                            const Text('Customer Last Name',
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.bold)),
                            const SizedBox(height: 10),
                            Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                decoration: BoxDecoration(
                                    color: const Color(0xFFF2F2F2),
                                    borderRadius: BorderRadius.circular(10)),
                                child: TextField(
                                  controller: customerLastNameCtrl,
                                  decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      hintText: 'Enter Last Name'),
                                )),
                            const SizedBox(height: 10),
                            inventoryBloc.isLoading
                                ? const CircularProgressIndicator.adaptive()
                                : Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 80),
                                    child: StretchableButton(
                                        text: 'Search Customer',
                                        onPressed: () {
                                          inventoryBloc.getCustomerList({
                                            'fname': customerFirstNameCtrl.text,
                                            'lname': customerLastNameCtrl.text,
                                            'accountNum': acctNumberCtrl.text,
                                            'userId': mainBloc.login.UserID,
                                          }, context);
                                        }),
                                  ),
                            const SizedBox(height: 10),
                            SizedBox(
                              width: double.infinity,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text('Select Customer',
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold)),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    decoration: BoxDecoration(
                                        color: const Color(0xFFF2F2F2),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: TextField(
                                        onTap: () {
                                          Navigator.of(context)
                                              .push(MaterialPageRoute(
                                                builder: (context) =>
                                                    const CustomerList(),
                                              ))
                                              .then((value) => setState(() {}));
                                        },
                                        readOnly: true,
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: inventoryBloc
                                                      .selectedCustomer ==
                                                  ''
                                              ? 'Select Customer'
                                              : inventoryBloc.selectedCustomer,
                                        )),
                                  )
                                ],
                              ),
                            )
                          ],
                        );
                      }
                      return SizedBox(
                        width: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Vehicle',
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.bold)),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              decoration: BoxDecoration(
                                  color: isDarkTheme
                                      ? ftGreyDark
                                      : const Color(0xFFF2F2F2),
                                  borderRadius: BorderRadius.circular(10)),
                              child: TextField(
                                  onTap: () {
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(
                                          builder: (context) =>
                                              const VehicleList(),
                                        ))
                                        .then((value) => setState(() {}));
                                  },
                                  readOnly: true,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText:
                                        inventoryBloc.selectedVehicle == ''
                                            ? 'Select Vehicle'
                                            : inventoryBloc.selectedVehicle,
                                  )),
                            )
                          ],
                        ),
                      );
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Divider(
                    thickness: 2,
                    indent: 10,
                    endIndent: 10,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            )),
            const SizedBox(
              height: 10,
            ),
            StretchableButton(
                text: 'Complete Transfer',
                onPressed: () async {
                  return showDialog<void>(
                    context: context,
                    barrierDismissible: false, // user must tap button!
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Execute Transfer'),
                        content: SingleChildScrollView(
                          child: ListBody(
                            children: const <Widget>[
                              Text(
                                  'Are you sure you want to execute item transfer?'),
                            ],
                          ),
                        ),
                        actions: <Widget>[
                          TextButton(
                            child: const Text('Cancel'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                          TextButton(
                            style: TextButton.styleFrom(
                                primary: const Color(0xffFFC82E)),
                            child: const Text('Yes'),
                            onPressed: () {
                              var itemList = inventoryBloc.listInLocationClass
                                  .where(
                                      (element) => element.IsChecked == true);
                              itemList.forEach((element) => dataList({
                                    'ItemID': element.ItemID,
                                    'Quantity': element.Quantity
                                  }));
                              if (radioValue == 'Warehouse') {
                                inventoryBloc.submitByWarehouse({
                                  'techId': loginBloc.techInfo.TechID,
                                  'items': items,
                                  'tracking': trackingCtrl.text,
                                  'carrier': carrierCtrl.text,
                                  'userId': mainBloc.login.UserID
                                }, context);
                              } else if (radioValue == 'Scrap') {
                                inventoryBloc.submitByScrap({
                                  'techId': loginBloc.techInfo.TechID,
                                  'items': items,
                                  'scrapReason': scrapCtrl.text,
                                  'userId': mainBloc.login.UserID,
                                }, context);
                              } else if (radioValue == 'Customer') {
                                inventoryBloc.submitByCustomer({
                                  'techId': loginBloc.techInfo.TechID,
                                  'items': items,
                                  'customerId':
                                      inventoryBloc.selectedCustomerId,
                                  'userId': mainBloc.login.UserID
                                }, context);
                              } else {
                                inventoryBloc.submitByVehicle({
                                  'techId': loginBloc.techInfo.TechID,
                                  'items': items,
                                  'vehicleId': inventoryBloc.selectedVehicleId,
                                  'userId': mainBloc.login.UserID
                                }, context);
                              }
                            },
                          ),
                        ],
                      );
                    },
                  );
                }),
            const SizedBox(
              height: 10,
            ),
            StretchableButton(
                text: 'Cancel', onPressed: () => Navigator.of(context).pop()),
          ],
        ),
      ),
    );
  }

  void dataList(Map<String, dynamic> map) {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ItemID'] = map['ItemID'];
    data['Quantity'] = map['Quantity'];
    items.add(data);
  }

  Widget radioButton(String title, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Radio(
          value: value,
          groupValue: radioValue,
          onChanged: (value) {
            setState(() {
              radioValue = value.toString();
            });
          },
        ),
        const SizedBox(
          width: 10,
        ),
        Text(title),
      ],
    );
  }
}
