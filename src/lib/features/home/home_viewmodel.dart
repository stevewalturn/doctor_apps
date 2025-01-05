import 'package:doctor_apps/app/app.locator.dart';
import 'package:doctor_apps/services/patient_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _patientService = locator<PatientService>();

  int _totalPatients = 0;
  int get totalPatients => _totalPatients;

  int _recentPatients = 0;
  int get recentPatients => _recentPatients;

  Future<void> initialize() async {
    await runBusyFuture(_loadDashboardData());
  }

  Future<void> _loadDashboardData() async {
    try {
      final patients = await _patientService.getPatients();
      _totalPatients = patients.length;
      _recentPatients = await _patientService.getRecentPatientsCount();
      notifyListeners();
    } catch (e) {
      setError('Unable to load dashboard data. Please try again.');
    }
  }

  Future<void> navigateToPatientList() async {
    try {
      await _navigationService.navigateTo('/patient-list-view');
    } catch (e) {
      setError('Unable to open patient list. Please try again.');
    }
  }

  Future<void> navigateToAddPatient() async {
    try {
      final result = await _navigationService.navigateTo('/patient-form-view');
      if (result == true) {
        await refreshDashboard();
      }
    } catch (e) {
      setError('Unable to open add patient form. Please try again.');
    }
  }

  Future<void> refreshDashboard() async {
    await runBusyFuture(_loadDashboardData());
  }

  void showNotifications() {
    // TODO: Implement notifications feature
    setError('Notifications feature coming soon!');
  }

  void showSettings() {
    // TODO: Implement settings feature
    setError('Settings feature coming soon!');
  }
}
