import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:ft/constants/state_const.dart';
import 'package:ft/modules/schedule/sched_details/service_call_details.dart';
import 'package:ft/modules/schedule/stop_work/stop_work.dart';
import 'package:http_parser/http_parser.dart';
import 'package:rxdart/subjects.dart';
import '../../../core/main/main.dart';
import '../../../models/creditcard/creditcard_dto.dart';
import '../../../models/event/stop_work_dto.dart';
import '../../../services/locator.dart';
import '../../../shared_widgets/toasts.dart';
import 'credit_card_repo.dart';

class CreditCardBloc {
  final creditCardRepo =
      (int server) => locator.get<CreditCardRepo>(param1: server, param2: '');
  final mainBloc = locator.get<MainBloc>();
  final serviceCallDetailsBloc = locator.get<ServiceCallDetailsBloc>();
  final stopWorkBloc = locator.get<StopWorkBloc>();
  final isLoading$ = BehaviorSubject<ButtonState>.seeded(ButtonState.loaded);

  Future<bool> validateCard(Map<String, dynamic> map) async {
    Map<String, dynamic> data =
        await creditCardRepo(map['server']).validateCard(map['card']);
    if (data['Status'] == "Valid") {
      return true;
    }
    return false;
  }

  postCreditCardCharge(
      StopWorkDto dto, CreditCardDto cDto, BuildContext context) async {
    isLoading$.add(ButtonState.loading);
    FormData formData = FormData.fromMap({
      "upload_file": MultipartFile.fromBytes(
          stopWorkBloc.currentCustomerSignature.value,
          filename: 'upload_file.jpg',
          contentType: MediaType('image', 'jpeg')),
    });

    final req = await creditCardRepo(dto.server).postCreditCardCharge(
        dto, cDto, mainBloc.login.GUID!, context, formData);
    if (req['Status'] == "Success") {
      final result = await stopWorkBloc.postStopWork(dto, context);
      if (result == 'Success') {
        isLoading$.add(ButtonState.loaded);
        showToast('Transaction Successful');
      } else {
        showToast('Transaction not successful');
        isLoading$.add(ButtonState.loaded);
      }
    } else {
      isLoading$.add(ButtonState.loaded);
      showToast('Transaction not successful');
    }
  }

  Future<String> postCreditCardMakeNRC(
      StopWorkDto dto, BuildContext context) async {
    Map<String, dynamic> data =
        await creditCardRepo(dto.server).postCreditCardMakeNRC(dto, context);

    if (data['Status'] == "Success") {
      return data['NrcID'].toString();
    } else {
      return '';
    }
  }

  Future<String> getCard(Map<String, dynamic> map) async {
    Map<String, dynamic> data = await creditCardRepo(map['server'])
        .getCreditCardRetrieveCC(map['customerId'], map['auth']);
    if (data['Status'] == "Status") {
      return 'test';
    }
    return '';
  }
}
