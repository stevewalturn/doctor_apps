import 'package:doctor_apps/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:doctor_apps/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:doctor_apps/features/home/home_view.dart';
import 'package:doctor_apps/features/startup/startup_view.dart';
import 'package:doctor_apps/features/patient/patient_form_view.dart';
import 'package:doctor_apps/features/patient/patient_list_view.dart';
import 'package:doctor_apps/features/patient/patient_detail_view.dart';
import 'package:doctor_apps/services/patient_service.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

@StackedApp(
  routes: [
    MaterialRoute(page: HomeView),
    MaterialRoute(page: StartupView),
    MaterialRoute(page: PatientFormView),
    MaterialRoute(page: PatientListView),
    MaterialRoute(page: PatientDetailView),
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: PatientService),
  ],
  bottomsheets: [
    StackedBottomsheet(classType: NoticeSheet),
  ],
  dialogs: [
    StackedDialog(classType: InfoAlertDialog),
  ],
)
class App {}
