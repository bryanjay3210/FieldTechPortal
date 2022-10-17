import 'package:flutter/material.dart';
import 'package:ft/models/gateway/dto/gateway_dto.dart';
import 'package:ft/models/gateway/gateway.dart';
import 'package:ft/shared_widgets/shared_app_bar.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import '../../../core/main/main.dart';
import '../../../services/locator.dart';
import '../../../shared_widgets/shared_dialog.dart';
import '../../../shared_widgets/toasts.dart';
import '../../../utils/utils/theme/global_colors.dart';
import '../../schedule/shared_widget/actions_button.dart';
import '../qr/qr.dart';
import 'select_location.dart';

class SelectLocationPage extends StatefulWidget {
  const SelectLocationPage({Key? key}) : super(key: key);

  @override
  State<SelectLocationPage> createState() => _SelectLocationPageState();
}

class _SelectLocationPageState extends State<SelectLocationPage> {
  final buildingCtrler = TextEditingController();
  final unitCtrler = TextEditingController();
  final macAddressCtrler = TextEditingController();

  final selectLocationBloc = locator.get<SelectLocationBloc>();
  final mainBloc = locator.get<MainBloc>();
  var maskFormatter = MaskTextInputFormatter(
      mask: "##:##:##:##:##:##", filter: {"#": RegExp('[a-f-A-F-0-9]')});
  final qrBloc = locator.get<QrBloc>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      buildingCtrler.text =
          selectLocationBloc.currentSelectedBuilding.BuildingName ?? '';
      unitCtrler.text = selectLocationBloc.currentSelectedUnit.UnitName ?? '';
      macAddressCtrler.text = await selectLocationBloc.currentGateway$.isEmpty
          ? selectLocationBloc.currentGateway$.value.GatewayName
          : '';
    });
  }

  @override
  Widget build(BuildContext context) {
    final isDarkTheme = mainBloc.isDarkTheme$.value;
    return Scaffold(
        appBar: appBarShared('Select Location', null),
        body: FutureBuilder<dynamic>(
            future: selectLocationBloc.getBuildings(context),
            builder: (context, snapshot) {
              if (snapshot.data == null) {
                return const Center(
                    child: CircularProgressIndicator.adaptive());
              }

              if (selectLocationBloc.buildingList.isEmpty ||
                  snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator.adaptive(),
                );
              }
              return SingleChildScrollView(
                  child: Padding(
                      padding:
                          const EdgeInsets.only(top: 20, left: 20, right: 20),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text('Building',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                        color: ftTextBlack)),
                                TextFormField(
                                    controller: buildingCtrler,
                                    readOnly: true,
                                    onTap: () async {
                                      await Navigator.pushNamed(
                                          context, 'building_list');
                                      buildingCtrler.text = selectLocationBloc
                                          .currentSelectedBuilding.BuildingName;
                                    },
                                    decoration: const InputDecoration(
                                      hintText: 'Select Building...',
                                    ),
                                    validator: (val) {
                                      if (val == null) {
                                        return 'Building required';
                                      }
                                      return null;
                                    },
                                    autovalidateMode: AutovalidateMode.always,
                                    onChanged: (str) {}),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Column(
                              children: <Widget>[
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text('Unit',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18,
                                            color: ftTextBlack)),
                                    TextFormField(
                                        controller: unitCtrler,
                                        readOnly: true,
                                        onTap: () async {
                                          if (buildingCtrler.text.isEmpty) {
                                            showToast('Select building first');
                                            return;
                                          }
                                          await Navigator.pushNamed(
                                              context, 'unit_list');
                                          final unit = selectLocationBloc
                                              .currentSelectedUnit;
                                          unitCtrler.text = unit.UnitName;
                                          selectLocationBloc
                                              .gatewayByUnit(unit);
                                        },
                                        decoration: const InputDecoration(
                                            hintText: 'Select Unit'),
                                        validator: (val) {
                                          if (val == null) {
                                            return 'Unit Required';
                                          }
                                          return null;
                                        },
                                        autovalidateMode:
                                            AutovalidateMode.always,
                                        onChanged: (str) {}),
                                  ],
                                ),
                                const SizedBox(
                                  height: 50,
                                ),
                                StreamBuilder<Gateway>(
                                    stream: selectLocationBloc.currentGateway$,
                                    builder: (context, snapshot) {
                                      if (snapshot.data == null) {
                                        return const SizedBox();
                                      }

                                      if (snapshot.data!.GatewayID == null) {
                                        return const Text(
                                          'This Unit has no MAC address',
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        );
                                      }

                                      final macAddress =
                                          snapshot.data!.MacAddress;
                                      macAddressCtrler.text = macAddress;

                                      final canEdit =
                                          macAddress.toString().length == 12;

                                      return Card(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(16.0),
                                        ),
                                        color: isDarkTheme
                                            ? ftBlackContainer
                                            : const Color(0xFFF2F2F2),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 15, vertical: 15),
                                          child: StreamBuilder<String>(
                                              stream: selectLocationBloc
                                                  .onTypeMacAddress$,
                                              builder: (context, snapshot) {
                                                final canSave = macAddressCtrler
                                                        .text.length ==
                                                    17;

                                                return Column(
                                                  children: [
                                                    const Text(
                                                      'Zigbee MAC Address',
                                                      style: TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.w800,
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      height: 20,
                                                    ),
                                                    TextField(
                                                      controller:
                                                          macAddressCtrler,
                                                      inputFormatters: [
                                                        maskFormatter
                                                      ],
                                                      onChanged: (str) {
                                                        if (canEdit) {
                                                          return;
                                                        }
                                                        selectLocationBloc
                                                            .onTypeMacAddress$
                                                            .add(str);
                                                      },
                                                      decoration:
                                                          InputDecoration(
                                                        filled: true,
                                                        fillColor: isDarkTheme
                                                            ? ftGreyDark
                                                            : const Color(
                                                                0xFFDADADA),
                                                        hintText:
                                                            'e.g ABCDEF1234567890',
                                                        border:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide.none,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                        ),
                                                        contentPadding:
                                                            const EdgeInsets
                                                                    .only(
                                                                left: 15,
                                                                bottom: 11,
                                                                top: 11,
                                                                right: 15),
                                                        suffixIcon: IconButton(
                                                          icon: const Icon(
                                                              Icons.qr_code,
                                                              color:
                                                                  ftPrimaryColor),
                                                          onPressed: () async {
                                                            await Navigator
                                                                .pushNamed(
                                                                    context,
                                                                    'qr');
                                                            macAddressCtrler
                                                                    .text =
                                                                qrBloc.qrCode;
                                                            selectLocationBloc
                                                                .onTypeMacAddress$
                                                                .add(qrBloc
                                                                    .qrCode);
                                                          },
                                                        ),
                                                      ),
                                                    ),
                                                    const SizedBox(height: 20),
                                                    macAddress
                                                            .toString()
                                                            .isEmpty
                                                        ? ActionButtons(
                                                            isEnable: canSave,
                                                            text: 'Save MAC',
                                                            callback: canSave
                                                                ? () async {
                                                                    selectLocationBloc.addGateWay(
                                                                        GatewayDto(
                                                                            macAddress:
                                                                                macAddressCtrler.text,
                                                                            buildingId: selectLocationBloc.currentSelectedBuilding.BuildingID,
                                                                            unitName: selectLocationBloc.currentSelectedUnit.UnitName),
                                                                        context);
                                                                  }
                                                                : () {})
                                                        : ActionButtons(
                                                            color: Colors.red,
                                                            isEnable: true,
                                                            text: 'Delete MAC',
                                                            callback: () async {
                                                              if (await showConfirmDialog(
                                                                  context,
                                                                  'Are you sure you want to delete this MAC of this unit?')) {
                                                                selectLocationBloc
                                                                    .removeGateWay(
                                                                        macAddressCtrler);
                                                              }
                                                            }),
                                                  ],
                                                );
                                              }),
                                        ),
                                      );
                                    }),
                              ],
                            )
                          ])));
            }));
  }
}
