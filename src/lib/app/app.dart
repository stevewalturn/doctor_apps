import 'package:doctor_apps/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:doctor_apps/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:doctor_apps/features/patient/patient_form_view.dart';
import 'package:doctor_apps/features/patient/patient_list_view.dart';
import 'package:doctor_apps/features/patient/patient_detail_view.dart';
import 'package:doctor_apps/features/startup/startup_view.dart';
import 'package:doctor_apps/services/patient_service.dart';
import 'package:doctor_apps/services/analytic_service.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

@StackedApp(
  routes: [
    MaterialRoute(page: StartupView, initial: true),
    MaterialRoute(page: PatientListView, path: '/patient-list'),
    MaterialRoute(page: PatientFormView, path: '/patient-form'),
    MaterialRoute(page: PatientDetailView, path: '/patient-detail'),
  ],
  dependencies: [
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: PatientService),
    LazySingleton(classType: AnalyticService),
  ],
  bottomsheets: [
    StackedBottomsheet(classType: NoticeSheet),
  ],
  dialogs: [
    StackedDialog(classType: InfoAlertDialog),
  ],
)
class App {}