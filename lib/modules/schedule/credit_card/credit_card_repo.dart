import 'package:flutter/widgets.dart';
import 'package:ft/services/api_service/api_request.dart';
import 'package:dio/dio.dart';

import '../../../models/creditcard/creditcard_dto.dart';
import '../../../models/event/stop_work_dto.dart';

class CreditCardRepo extends RequestApi {
  CreditCardRepo(super.server);

  dynamic validateCard(String cardNumber) async {
    dynamic dataUrl = {
      "Command": "Account",
      "Subcommand1": "ValidateCard",
      "CardNumber": cardNumber
    };
    return await getApi(dataUrl);
  }

  dynamic postCreditCardMakeNRC(StopWorkDto dto, BuildContext context) async {
    dynamic dataUrl = {
      "Command": "Technician",
      "Subcommand1": "MakeNRC",
      "CustomerID": dto.customerId,
      "TechID": dto.techId,
      "ChargeAmount": dto.charges![3],
      "TicketID": dto.ticketId
    };
    return await getApi(dataUrl, context: context);
  }

  dynamic postCreditCardCharge(StopWorkDto dto, CreditCardDto cDto, String auth,
      BuildContext context, FormData formData) async {
    dynamic dataUrl = {
      "Command": "Account",
      "Subcommand1": "MakePayment",
      "Subcommand2": "PayNRC",
      "CustomerID": dto.customerId,
      "UserID": dto.techId,
      "Auth": auth,
      "BillingZip": cDto.billingZip,
      "PaymentMethod": cDto.paymentMethod,
      "TotalCharge": cDto.totalCharge,
      "UseStoredCard": "N",
      "CardholderName": cDto.cardHolderName,
      // "CardNumber": "4111111111111111",
      "CardNumber": cDto.cardNumber,
      "CardType": cDto.cardType,
      "CardExpDate": cDto.cardExpDate,
      "CVV": cDto.ccv,
      "NrcID": cDto.nrcId,
      "TicketID": dto.ticketId
    };
    return await getApi(dataUrl, context: context, formData: formData);
  }

  dynamic getCreditCardRetrieveCC(String customerId, String auth) async {
    dynamic dataUrl = {
      "Command": "Account",
      "Subcommand1": "GetCard",
      "UserID": customerId,
      "Auth": auth
    };
    return await getApi(dataUrl);
  }
}
