import 'package:flutter/material.dart';
import 'package:ft/constants/state_const.dart';
import 'package:ft/modules/inventory/inventory.dart';
import 'package:ft/services/locator.dart';

class CustomerList extends StatefulWidget {
  const CustomerList({Key? key}) : super(key: key);

  @override
  State<CustomerList> createState() => _CustomerListState();
}

class _CustomerListState extends State<CustomerList> {
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
              const Text('Select Customer', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
              const SizedBox(height: 20,),
              Expanded(
                child: StreamBuilder<DataState>(
                    stream: inventoryBloc.inventoryListState$,
                    builder: (context, snapshot) {
                      if(snapshot.data == DataState.success && inventoryBloc.customerList.isEmpty){
                        return Center(child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [SizedBox(width:100, height: 100, child: Image.asset('lib/assets/icon/empty.png')), const SizedBox(height: 10,), const Text('No record found')],));
                      }
                      if(snapshot.data == DataState.success && inventoryBloc.customerList.isNotEmpty){
                        return ListView.builder(
                          itemCount: inventoryBloc.customerList.length,
                          itemBuilder: (context, index) {
                            var element = inventoryBloc.customerList[index];
                            return Column(
                              children: [
                                GestureDetector(
                                  onTap: (){
                                    inventoryBloc.selectedCustomerId = int.parse(element.CustomerID);
                                    inventoryBloc.selectedCustomer = element.Fname + ' ' + element.Lname;
                                    Navigator.of(context).pop();
                                  },
                                  child: SizedBox(
                                    height: 35,
                                    child: Row(
                                      children: [
                                        const Icon(Icons.account_circle, color: Color(0xffFFC82E), size: 30),
                                        const SizedBox(width: 10,),
                                        Text('${element.Fname} ${element.Lname}')
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
