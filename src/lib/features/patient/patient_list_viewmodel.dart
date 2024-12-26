import 'package:doctor_apps/app/app.locator.dart';
import 'package:doctor_apps/models/patient.dart';
import 'package:doctor_apps/services/patient_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class PatientListViewModel extends BaseViewModel {
  final _patientService = locator<PatientService>();
  final _navigationService = locator<NavigationService>();

  List<Patient> _patients = [];
  List<Patient> get patients => _patients;

  String? _searchQuery;
  String? get searchQuery => _searchQuery;

  Future<void> initialize() async {
    await runBusyFuture(_loadPatients());
  }

  Future<void> _loadPatients() async {
    try {
      _patients = await _patientService.getPatients();
      if (_searchQuery != null && _searchQuery!.isNotEmpty) {
        _patients = _patients
            .where((patient) =>
                patient.name
                    .toLowerCase()
                    .contains(_searchQuery!.toLowerCase()) ||
                patient.phone.contains(_searchQuery!))
            .toList();
      }
      notifyListeners();
    } catch (e) {
      setError('Failed to load patients. Please try again.');
    }
  }

  void onSearchQueryChanged(String query) {
    _searchQuery = query;
    rebuildUi();
  }

  Future<void> refreshPatients() async {
    await runBusyFuture(_loadPatients());
  }

  Future<void> navigateToAddPatient() async {
    try {
      await _navigationService.navigateTo('/patient-form');
      await refreshPatients();
    } catch (e) {
      setError('Unable to navigate to add patient form. Please try again.');
    }
  }

  Future<void> navigateToPatientDetail(int patientId) async {
    try {
      final result = await _navigationService.navigateWithTransition(
        PatientDetailView(patientId: patientId),
        transition: NavigationTransition.rightToLeft,
      );
      if (result == true) {
        await refreshPatients();
      }
    } catch (e) {
      setError('Unable to open patient details. Please try again.');
    }
  }

  Future<void> deletePatient(int patientId) async {
    try {
      await runBusyFuture(_patientService.deletePatient(patientId));
      await _loadPatients();
    } catch (e) {
      setError('Failed to delete patient. Please try again.');
    }
  }
}
