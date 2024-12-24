import 'package:doctor_apps/app/app.locator.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  void navigateToAddPatient() {
    _navigationService.navigateTo('/patient-form');
  }

  void navigateToPatientList() {
    _navigationService.navigateTo('/patient-list');
  }
}
