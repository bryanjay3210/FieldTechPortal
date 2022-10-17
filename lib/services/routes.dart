import 'package:ft/modules/inventory/inventory_page.dart';
import 'package:ft/modules/pairing/device/list_device_page.dart';
import 'package:ft/modules/pairing/device/pair_device_page.dart';
import 'package:ft/modules/pairing/pairing_page.dart';
import 'package:ft/modules/policy/policy_page.dart';
import 'package:ft/modules/schedule/schedule_page.dart';
import 'package:ft/modules/settings/settings.dart';
import '../core/login/login_page.dart';
import '../core/main/main_page.dart';
import '../modules/home/home.dart';
import '../modules/pairing/qr/qr_page.dart';
import '../modules/pairing/select_location/building_list_page.dart';
import '../modules/pairing/select_location/select_location_page.dart';
import '../modules/pairing/select_location/unit_list_page.dart';
import '../modules/schedule/credit_card/credit_card_page.dart';
import '../modules/schedule/sched_details/service_call_details_page.dart';
import '../modules/schedule/start_work/start_work_page.dart';
import '../modules/schedule/stop_work/signature_page.dart';
import '../modules/schedule/stop_work/stop_work_page.dart';

dynamic routes() {
  return {
    '/': (context) => const MainPage(),
    'login': (context) => const LoginPage(),

    //modules
    'home': (context) => const HomePage(),
    'inventory': (context) => const InventoryPage(),
    'pairing': (context) => const PairingPage(),
    'policy': (context) => const PolicyPage(),
    'schedule': (context) => const SchedulePage(),
    'settings': (context) => const SettingsPage(),
    'service_call_details': (context) => const ServiceCallDetailsPage(),
    'start_work': (context) => const StartWorkPage(),
    'stop_work': (context) => const StopWorkPage(),
    'credit_card': (context) => const CreditCardPage(),
    'signature': (context) => const SignaturePage(),
    'select_location': (context) => const SelectLocationPage(),
    'building_list': (context) => const BuildingListPage(),
    'unit_list': (context) => const UnitListPage(),
    'list_device': (context) => const ListDevicePage(),
    'pair_device': (context) => const PairDevicePage(),
    'qr': (context) => const QrPage(),
    'inventory_page': (context) => const InventoryPage(),
  };
}
