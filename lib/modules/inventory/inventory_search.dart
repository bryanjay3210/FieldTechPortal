import 'package:flutter/material.dart';
import 'package:ft/constants/state_const.dart';
import 'package:ft/modules/inventory/transfer_goods.dart';
import 'package:ft/services/locator.dart';
import 'package:ft/shared_widgets/shared_app_bar.dart';
import 'package:ft/shared_widgets/shared_button.dart';

import 'inventory.dart';

class InventorySearch extends StatefulWidget {
  const InventorySearch({Key? key}) : super(key: key);

  @override
  State<InventorySearch> createState() => _InventorySearchState();
}

class _InventorySearchState extends State<InventorySearch> {
  @override
  Widget build(BuildContext context) {
    final inventoryBloc = locator.get<InventoryBloc>();
    return Scaffold(
      appBar: appBarShared(
          inventoryBloc.selectedName +
              ' (${inventoryBloc.inventorySearch[0].locations.length} Items)',
          null),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: StreamBuilder<DataState>(
            stream: inventoryBloc.inventoryListState$,
            builder: (context, snapshot) {
              if (snapshot.data == DataState.success &&
                  inventoryBloc.inventorySearch.isNotEmpty) {
                return ListView.builder(
                  itemCount: inventoryBloc.inventorySearch[0].locations.length,
                  itemBuilder: (context, index) {
                    var element = inventoryBloc.inventorySearch[0];
                    return Column(
                      children: [
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            // color: const Color(0xFFF2F2F2),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                element.productName,
                                style: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: const [
                                      Text('Row:'),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text('Rack:'),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text('Shelf:'),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text('Quantity:'),
                                    ],
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(element.locations[index]['RowName']),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                          element.locations[index]['RackName']),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text(element.locations[index]
                                          ['ShelfName']),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                          element.locations[index]['Quantity']),
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              StretchableButton(
                                  text: 'Transfer',
                                  onPressed: () {
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(
                                      builder: (context) =>
                                          const TransferGoods(),
                                    ));
                                  }),
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
                  inventoryBloc.inventorySearch.isEmpty) {
                return Center(child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [SizedBox(width:100, height: 100, child: Image.asset('lib/assets/icon/empty.png')), const SizedBox(height: 10,), const Text('No record found')],));
              }
              return const Center(
                child: CircularProgressIndicator.adaptive(),
              );
            },
          ),
        ),
      ),
    );
  }
}
