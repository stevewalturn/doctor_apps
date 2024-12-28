import 'package:doctor_apps/app/app.locator.dart';
import 'package:doctor_apps/models/patient.dart';
import 'package:doctor_apps/services/patient_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class PatientListViewModel extends BaseViewModel {
  final _patientService = locator<PatientService>();
  final _navigationService = locator<NavigationService>();

  List<Patient> _allPatients = [];
  List<Patient> _filteredPatients = [];
  List<Patient> get patients => _filteredPatients;

  String _searchQuery = '';
  String get searchQuery => _searchQuery;

  Future<void> initialize() async {
    await runBusyFuture(_loadPatients());
  }

  Future<void> _loadPatients() async {
    try {
      _allPatients = await _patientService.getPatients();
      _applySearch();
    } catch (e) {
      setError(
          'Unable to load patients. Please check your connection and try again.');
    }
  }

  void onSearchQueryChanged(String query) {
    _searchQuery = query;
    _applySearch();
  }

  void _applySearch() {
    if (_searchQuery.isEmpty) {
      _filteredPatients = List.from(_allPatients);
    } else {
      final searchLower = _searchQuery.toLowerCase();
      _filteredPatients = _allPatients
          .where((patient) =>
              patient.name.toLowerCase().contains(searchLower) ||
              patient.phone.contains(searchLower))
          .toList();
    }
    notifyListeners();
  }

  Future<void> refreshPatients() async {
    await runBusyFuture(_loadPatients());
  }

  Future<void> navigateToAddPatient() async {
    try {
      await _navigationService.navigateToView(const PatientFormView());
      await refreshPatients();
    } catch (e) {
      setError('Unable to open add patient form. Please try again.');
    }
  }

  Future<void> navigateToPatientDetail(int patientId) async {
    try {
      final result = await _navigationService.navigateToView(
        PatientDetailView(patientId: patientId),
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
