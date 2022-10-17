import 'package:flutter/widgets.dart';
import 'package:ft/services/api_service/api_request.dart';

class MainRepo extends RequestApi {
  MainRepo(super.server);

  dynamic getTechnicianRate(
      Map<String, dynamic> map, BuildContext context) async {
    dynamic dataUrl = {
      "Command": "Technician",
      "Subcommand1": "Rates",
      "TechID": map['techId']
    };
    return await getApi(dataUrl, context: context);
  }

  dynamic getTechnician(Map<String, dynamic> map, BuildContext context) async {
    dynamic dataUrl =  {
      "Command":"Technician",
      "Subcommand1":"Fetch",
      "TechID": map['techId'],
    };
    return await getApi(dataUrl, context: context);
  }
}
