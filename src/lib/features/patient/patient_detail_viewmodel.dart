import 'package:doctor_apps/app/app.locator.dart';
import 'package:doctor_apps/models/patient.dart';
import 'package:doctor_apps/services/patient_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class PatientDetailViewModel extends BaseViewModel {
  final _patientService = locator<PatientService>();
  final _navigationService = locator<NavigationService>();

  final int patientId;
  Patient? _patient;
  Patient? get patient => _patient;

  PatientDetailViewModel({required this.patientId});

  Future<void> initialize() async {
    try {
      setBusy(true);
      _patient = await _patientService.getPatient(patientId);
      notifyListeners();
    } catch (e) {
      setError(
          'Unable to load patient details. Please check your connection and try again.');
    } finally {
      setBusy(false);
    }
  }

  Future<void> navigateToEdit() async {
    try {
      final result = await _navigationService.navigateWithTransition(
        PatientFormView(patientId: patientId),
        transition: NavigationTransition.rightToLeft,
      );
      if (result == true) {
        await initialize();
      }
    } catch (e) {
      setError('Unable to open edit form. Please try again.');
    }
  }
}
