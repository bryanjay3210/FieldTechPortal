import 'package:flutter/material.dart';
import 'package:ft/constants/state_const.dart';
import 'package:ft/core/main/main.dart';
import 'package:ft/modules/inventory/inventory.dart';
import 'package:ft/services/locator.dart';
import 'package:ft/shared_widgets/shared_app_bar.dart';
import 'package:ft/shared_widgets/shared_button.dart';

import 'complete_transfer.dart';

class TransferGoods extends StatefulWidget {
  const TransferGoods({Key? key}) : super(key: key);

  @override
  State<TransferGoods> createState() => _TransferGoodsState();
}

class _TransferGoodsState extends State<TransferGoods> {
  var myControllers = [];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadData();
    });
  }

  _loadData() async {
    final mainBloc = locator.get<MainBloc>();
    final inventoryBloc = locator.get<InventoryBloc>();
    await inventoryBloc.getListInLocation({
      'productId': inventoryBloc.inventorySearch[0].productID,
      'locationId': inventoryBloc.inventorySearch[0].locations[0]['ShelfID'],
      // 'vehicleId' : ,
      'userId': mainBloc.login.UserID,
    }, context);

    for (var i = 0; i < inventoryBloc.listInLocation.length; i++) {
      myControllers.add(TextEditingController(
          text: inventoryBloc.listInLocation[i].Quantity));
    }
  }

  @override
  Widget build(BuildContext context) {
    final inventoryBloc = locator.get<InventoryBloc>();
    return Scaffold(
      appBar: appBarShared('Transfer Goods', null),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          children: [
            Expanded(
                child: StreamBuilder<DataState>(
              stream: inventoryBloc.inventoryListState$,
              builder: (context, snapshot) {
                if (snapshot.data == DataState.success &&
                    inventoryBloc.listInLocation.isNotEmpty) {
                  return ListView.builder(
                    itemCount: inventoryBloc.listInLocation.length,
                    itemBuilder: (context, index) {
                      // if(inventoryBloc.listInLocation[index].MAC.toString() == '{}' && inventoryBloc.listInLocation[index].MAC.toString() == '{}'){
                      //   textEditingControllers[index].text = inventoryBloc.listInLocation[index].Quantity.toString();
                      // }
                      return Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.fromLTRB(10, 0, 10, 20),
                            width: double.infinity,
                            decoration: BoxDecoration(
                                // color: const Color(0xFFF2F2F2),
                                borderRadius: BorderRadius.circular(15)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                    width: 50,
                                    child: Center(
                                      child: Checkbox(
                                          value: inventoryBloc
                                              .listInLocationClass[index]
                                              .IsChecked,
                                          onChanged: (value) {
                                            setState(() {
                                              inventoryBloc
                                                      .listInLocationClass[index]
                                                      .IsChecked =
                                                  !inventoryBloc
                                                      .listInLocationClass[
                                                          index]
                                                      .IsChecked;
                                            });
                                          }),
                                    )),
                                const SizedBox(
                                  width: 5,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    inventoryBloc.listInLocation[index].MAC
                                                    .toString() ==
                                                '{}' &&
                                            inventoryBloc.listInLocation[index]
                                                    .SerialNum
                                                    .toString() ==
                                                '{}'
                                        ? const SizedBox()
                                        : const SizedBox(height: 30),
                                    const Text('Product Name:'),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    const Text('Serial Number:'),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    const Text('MAC Address:'),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    const Text('Quantity:'),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Text(inventoryBloc
                                        .inventorySearch[0].productName
                                        .toString()),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(inventoryBloc
                                                .listInLocation[index].SerialNum
                                                .toString() ==
                                            '{}'
                                        ? 'N/A'
                                        : inventoryBloc
                                            .listInLocation[index].SerialNum
                                            .toString()),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(inventoryBloc.listInLocation[index].MAC
                                                .toString() ==
                                            '{}'
                                        ? 'N/A'
                                        : inventoryBloc
                                            .listInLocation[index].MAC
                                            .toString()),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    inventoryBloc.listInLocation[index].MAC
                                                    .toString() ==
                                                '{}' &&
                                            inventoryBloc.listInLocation[index]
                                                    .SerialNum
                                                    .toString() ==
                                                '{}'
                                        ? Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const SizedBox(
                                                height: 15,
                                              ),
                                              SizedBox(
                                                  height: 10,
                                                  width: 100,
                                                  child: TextField(
                                                    controller:
                                                        myControllers[index],
                                                    keyboardType:
                                                        TextInputType.number,
                                                    onChanged: (value) {
                                                      if (value.isNotEmpty) {
                                                        inventoryBloc
                                                                .listInLocationClass[
                                                                    index]
                                                                .Quantity =
                                                            int.parse(value);
                                                      }
                                                    },
                                                  )),
                                              const SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                  '(max. ${inventoryBloc.listInLocation[index].Quantity})',
                                                  style: const TextStyle(
                                                      fontSize: 12,
                                                      color: Colors.grey)),
                                            ],
                                          )
                                        : Text(inventoryBloc
                                            .listInLocation[index].Quantity
                                            .toString()),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                        ],
                      );
                    },
                  );
                }
                if (snapshot.data == DataState.success &&
                    inventoryBloc.listInLocation.isEmpty) {
                  return Center(child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [SizedBox(width:100, height: 100, child: Image.asset('lib/assets/icon/empty.png')), const SizedBox(height: 10,), const Text('No record found')],));
                }
                return const Center(
                    child: CircularProgressIndicator.adaptive());
              },
            )),
            const SizedBox(
              height: 10,
            ),
            StretchableButton(
                text: 'Transfer',
                onPressed: () {
                  if (inventoryBloc.listInLocationClass
                      .where((element) => element.IsChecked == true)
                      .isEmpty) return;
                  for (var el in inventoryBloc.listInLocationClass) {
                    var ds = inventoryBloc.listInLocation.firstWhere(
                        (element) => int.parse(element.ItemID) == el.ItemID);
                    if (el.Quantity > int.parse(ds.Quantity)) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("Invalid Quantity"),
                      ));
                      return;
                    }
                  }
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const CompleteTransfer(),
                  ));
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
}
