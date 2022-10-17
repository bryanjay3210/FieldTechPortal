import 'package:ft/modules/inventory/inventory.dart';
import 'package:ft/modules/inventory/inventory_repo.dart';
import 'package:ft/modules/pairing/device/device_repo.dart';
import 'package:get_it/get_it.dart';

import '../core/login/login.dart';
import '../core/login/login_repo.dart';
import '../core/main/main.dart';
import '../core/main/main_repo.dart';
import '../modules/pairing/device/device.dart';
import '../modules/pairing/qr/qr.dart';
import '../modules/pairing/select_location/select_location.dart';
import '../modules/pairing/select_location/select_location_repo.dart';
import '../modules/schedule/credit_card/credit_card.dart';
import '../modules/schedule/credit_card/credit_card_repo.dart';
import '../modules/schedule/sched_details/service_call_details.dart';
import '../modules/schedule/sched_details/service_call_details_repo.dart';
import '../modules/schedule/schedule.dart';
import '../modules/schedule/schedule_repo.dart';
import '../modules/schedule/start_work/start_work.dart';
import '../modules/schedule/start_work/start_work_repo.dart';
import '../modules/schedule/stop_work/stop_work.dart';
import '../modules/schedule/stop_work/stop_work_repo.dart';

final locator = GetIt.I;

void locatorSetup() {
  locator.registerLazySingleton<LoginBloc>(() => LoginBloc());
  locator.registerLazySingleton<MainBloc>(() => MainBloc());
  locator.registerLazySingleton<ScheduleBloc>(() => ScheduleBloc());
  locator.registerLazySingleton<ServiceCallDetailsBloc>(
      () => ServiceCallDetailsBloc());
  locator.registerLazySingleton<StartWorkBloc>(() => StartWorkBloc());
  locator.registerLazySingleton<StopWorkBloc>(() => StopWorkBloc());
  locator.registerLazySingleton<CreditCardBloc>(() => CreditCardBloc());
  locator.registerLazySingleton<SelectLocationBloc>(() => SelectLocationBloc());
  locator.registerLazySingleton<DeviceBloc>(() => DeviceBloc());
  locator.registerLazySingleton<QrBloc>(() => QrBloc());
  locator.registerLazySingleton<InventoryBloc>(() => InventoryBloc());

  locator.registerFactoryParam<MainRepo, int, String>(
      (param1, _) => MainRepo(param1));
  locator.registerFactoryParam<LoginRepo, int, String>(
      (param1, _) => LoginRepo(param1));
  locator.registerFactoryParam<ScheduleRepo, int, String>(
      (param1, _) => ScheduleRepo(param1));
  locator.registerFactoryParam<ServiceCallDetailsRepo, int, String>(
      (param1, _) => ServiceCallDetailsRepo(param1));
  locator.registerFactoryParam<StartWorkRepo, int, String>(
      (param1, _) => StartWorkRepo(param1));
  locator.registerFactoryParam<StopWorkRepo, int, String>(
      (param1, _) => StopWorkRepo(param1));
  locator.registerFactoryParam<CreditCardRepo, int, String>(
      (param1, _) => CreditCardRepo(param1));
  locator.registerFactoryParam<SelectLocationRepo, int, String>(
      (param1, _) => SelectLocationRepo(param1));
  locator.registerFactoryParam<DeviceRepo, int, String>(
      (param1, _) => DeviceRepo(param1));
  locator.registerFactoryParam<InventoryRepo, int, String>(
          (param1, _) => InventoryRepo(param1));
}
