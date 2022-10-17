import 'package:flutter/widgets.dart';
import 'package:ft/constants/state_const.dart';
import 'package:ft/core/main/main.dart';
import 'package:ft/models/geo_location/geo_location.dart';
import 'package:ft/models/technician/available_technician.dart';
import 'package:ft/shared_widgets/toasts.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hive/hive.dart';
import 'package:rxdart/rxdart.dart';
import '../../../models/customer/customer.dart';
import '../../../models/customer_event/customer_event.dart';
import '../../../models/event/event.dart';
import '../../../models/event/travel_dto.dart';
import '../../../services/locator.dart';
import 'service_call_details_repo.dart';

class ServiceCallDetailsBloc {
  final hive = Hive.box('service_call');
  var selectedEvent = Event();
  var currentCustomer = Customer();
  List<GeoLocation> location = [];
  Position? startTravel;
  Position? stopTravel;
  var canBePopped = true;
  var currentCustomerEvent = CustomerEvent();
  final callServiceStatus$ = BehaviorSubject<int>.seeded(0);
  // ignore: prefer_function_declarations_over_variables
  final _serviceCallDetailsRepo = (int server) =>
      locator.get<ServiceCallDetailsRepo>(param1: server, param2: '');
  final isLoading$ = BehaviorSubject<bool>.seeded(false);
  var availableTechnician = <String>[];
  var availableTechnicianList = <AvailableTechnician>[];
  final availableTechnicianStatus$ = BehaviorSubject<DataState>();

  Future<CustomerEvent> getEvent(Map<String, dynamic> map,
      {BuildContext? context}) async {
    final mainBloc = locator.get<MainBloc>();
    Map<String, dynamic> data =
        await _serviceCallDetailsRepo(mainBloc.server).getEvent(map, context: context);
    currentCustomer = Customer.fromJson(data['Event']['Customer']);
    currentCustomerEvent = CustomerEvent.fromJson(data['Event']);
    if(currentCustomerEvent.EventStatus == 'Stop Travel' || currentCustomerEvent.EventStatus == 'Inproc'){
      callServiceStatus$.add(3);
      if(data['Event']['Geolocations'] is List<dynamic>){
        data['Event']['Geolocations'].forEach((el) {
          if(el['Type'] == 'Start Travel'){
            location.add(GeoLocation.fromJson(el));
          } else if(el['Type'] == 'Stop Travel'){
            location.add(GeoLocation.fromJson(el));
          }
        });
      }
    }
    return currentCustomerEvent;
  }

  onSelectedToken(Event event) {
    if (event.TicketID == selectedEvent.TicketID) {
    } else {
      selectedEvent = event;
    }

    callServiceStatus$.add(0);
  }

  postTravel(TravelDto dto, BuildContext context) async {
    Map<String, dynamic> data =
        await _serviceCallDetailsRepo(dto.server).postTravel(dto, context);
    if (data['Status'] != 'Success') {
      callServiceStatus$.add(0);
      return;
    }
    canBePopped = false;
    run() {
      if (dto.travelType == 'StartTravel') {
        startTravel = dto.position;
        callServiceStatus$.add(1);
      } else {
        stopTravel = dto.position;
        callServiceStatus$.add(2);
      }
    }

    if (data['Status'] == "Success") {
      run();
    } else {
      callServiceStatus$.add(0);
    }
    run();
  }

  getTechnician(Map<String, dynamic> map, BuildContext context) async{
    availableTechnicianStatus$.add(DataState.loading);
    availableTechnician.clear();
    availableTechnicianList.clear();
    Map<String, dynamic> data =
    await _serviceCallDetailsRepo(map['server']).getTechnician(map, context);
    if (data['Status'] == 'Success') {
      if(data['Technician'] is Map){
        availableTechnician.add(data['Technician']['TechName']);
        availableTechnicianList.add(AvailableTechnician.fromJson(data['Technician']));
        availableTechnicianStatus$.add(DataState.success);
      } else if(data['Technician'] is List<dynamic>){
        data['Technician'].forEach((element) => availableTechnician.add(element['TechName']));
        data['Technician'].forEach((element) => availableTechnicianList.add(AvailableTechnician.fromJson(element)));
        availableTechnicianStatus$.add(DataState.success);
      } else {
        availableTechnicianStatus$.add(DataState.success);
      }
    }
  }

  reAssignTicket(Map<String, dynamic> map, BuildContext context) async{
    Map<String, dynamic> data =
    await _serviceCallDetailsRepo(map['server']).reassignTicket(map, context);
    if (data['Status'] == 'Success') {
      Navigator.pop(context);
      Navigator.pop(context);
      showToast(data['Status']);
    } else {
      showToast(data['Status']);
    }
  }

  dynamic getServiceCall(Map<String, dynamic> map, BuildContext context) async{
    Map<String, dynamic> data =
        await _serviceCallDetailsRepo(map['server']).getServiceCall(map, context: context);
    return data;
  }
}
