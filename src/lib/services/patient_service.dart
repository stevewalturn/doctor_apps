import 'package:doctor_apps/features/patient/patient_repository.dart';
import 'package:doctor_apps/models/patient.dart';
import 'package:doctor_apps/services/analytic_service.dart';
import 'package:stacked/stacked_annotations.dart';

class PatientService implements InitializableDependency {
  final _repository = PatientRepository();
  final _analyticService = AnalyticService();

  @override
  Future<void> init() async {
    // Initialize any required resources
    await _repository.init();
  }

  Future<List<Patient>> getPatients() async {
    try {
      return await _repository.getPatients();
    } catch (e) {
      throw Exception('Unable to load patients. Please try again later.');
    }
  }

  Future<Patient> getPatient(int id) async {
    try {
      return await _repository.getPatient(id);
    } catch (e) {
      throw Exception('Unable to find patient details. Please try again.');
    }
  }

  Future<Patient> createPatient(Patient patient) async {
    try {
      final newPatient = await _repository.createPatient(patient);
      await _analyticService.logEvent('patient_created');
      return newPatient;
    } catch (e) {
      throw Exception('Unable to create patient record. Please try again.');
    }
  }

  Future<Patient> updatePatient(Patient patient) async {
    try {
      final updatedPatient = await _repository.updatePatient(patient);
      await _analyticService.logEvent('patient_updated');
      return updatedPatient;
    } catch (e) {
      throw Exception('Unable to update patient record. Please try again.');
    }
  }

  Future<void> deletePatient(int id) async {
    try {
      await _repository.deletePatient(id);
      await _analyticService.logEvent('patient_deleted');
    } catch (e) {
      throw Exception('Unable to delete patient record. Please try again.');
    }
  }

  Future<int> getRecentPatientsCount() async {
    try {
      final patients = await getPatients();
      final weekAgo = DateTime.now().subtract(const Duration(days: 7));
      return patients
          .where((patient) => true)
          .length; // Placeholder for created date check
    } catch (e) {
      throw Exception('Unable to get recent patients count. Please try again.');
    }
  }
}
