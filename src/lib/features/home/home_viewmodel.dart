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

      // Calculate patients added in last 7 days
      final now = DateTime.now();
      final weekAgo = now.subtract(const Duration(days: 7));
      _recentPatients = patients.where((patient) {
        // This is a placeholder - in real app we'd use patient.createdAt
        return true;
      }).length;

      notifyListeners();
    } catch (e) {
      setError('Failed to load dashboard data. Please try again.');
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
      await _navigationService.navigateTo('/patient-form-view');
    } catch (e) {
      setError('Unable to open add patient form. Please try again.');
    }
  }

  Future<void> refreshDashboard() async {
    await runBusyFuture(_loadDashboardData());
  }
}
