import 'package:doctor_apps/features/patient/patient_repository.dart';
import 'package:doctor_apps/models/patient.dart';
import 'package:doctor_apps/services/analytic_service.dart';
import 'package:doctor_apps/utils/const/const.dart';
import 'package:stacked/stacked_annotations.dart';

class PatientService implements InitializableDependency {
  final _repository = PatientRepository();
  final _analyticService = AnalyticService();

  @override
  Future<void> init() async {
    // Initialize any required resources
  }

  Future<List<Patient>> getPatients() async {
    try {
      return await _repository.getPatients();
    } catch (e) {
      throw Exception(kErrorLoadingPatients);
    }
  }

  Future<Patient> getPatient(int id) async {
    try {
      return await _repository.getPatient(id);
    } catch (e) {
      throw Exception('Unable to find patient with ID: $id');
    }
  }

  Future<Patient> createPatient(Patient patient) async {
    try {
      final newPatient = await _repository.createPatient(patient);
      _analyticService.logPatientCreated();
      return newPatient;
    } catch (e) {
      throw Exception(kErrorSavingPatient);
    }
  }

  Future<Patient> updatePatient(Patient patient) async {
    try {
      final updatedPatient = await _repository.updatePatient(patient);
      _analyticService.logPatientUpdated();
      return updatedPatient;
    } catch (e) {
      throw Exception(kErrorSavingPatient);
    }
  }

  Future<void> deletePatient(int id) async {
    try {
      await _repository.deletePatient(id);
      _analyticService.logPatientDeleted();
    } catch (e) {
      throw Exception(kErrorDeletingPatient);
    }
  }
}
