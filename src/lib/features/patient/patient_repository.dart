import 'package:doctor_apps/models/patient.dart';
import 'package:doctor_apps/utils/const/const.dart';

class PatientRepository {
  // In-memory storage for demonstration
  final List<Patient> _patients = [];
  int _nextId = 1;

  Future<List<Patient>> getPatients() async {
    try {
      // Simulate network delay
      await Future.delayed(const Duration(milliseconds: 500));
      return _patients;
    } catch (e) {
      throw Exception(kErrorLoadingPatients);
    }
  }

  Future<Patient> getPatient(int id) async {
    try {
      await Future.delayed(const Duration(milliseconds: 500));
      final patient = _patients.firstWhere(
        (p) => p.id == id,
        orElse: () => throw Exception('Patient not found'),
      );
      return patient;
    } catch (e) {
      throw Exception('Unable to find patient with ID: $id');
    }
  }

  Future<Patient> createPatient(Patient patient) async {
    try {
      await Future.delayed(const Duration(milliseconds: 500));
      final newPatient = Patient(
        id: _nextId++,
        name: patient.name,
        age: patient.age,
        gender: patient.gender,
        phone: patient.phone,
        address: patient.address,
        medicalHistory: patient.medicalHistory,
      );
      _patients.add(newPatient);
      return newPatient;
    } catch (e) {
      throw Exception(kErrorSavingPatient);
    }
  }

  Future<Patient> updatePatient(Patient patient) async {
    try {
      await Future.delayed(const Duration(milliseconds: 500));
      final index = _patients.indexWhere((p) => p.id == patient.id);
      if (index == -1) {
        throw Exception('Patient not found');
      }
      _patients[index] = patient;
      return patient;
    } catch (e) {
      throw Exception(kErrorSavingPatient);
    }
  }

  Future<void> deletePatient(int id) async {
    try {
      await Future.delayed(const Duration(milliseconds: 500));
      final index = _patients.indexWhere((p) => p.id == id);
      if (index == -1) {
        throw Exception('Patient not found');
      }
      _patients.removeAt(index);
    } catch (e) {
      throw Exception(kErrorDeletingPatient);
    }
  }
}
