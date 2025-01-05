import 'package:doctor_apps/models/patient.dart';

class PatientRepository {
  final List<Patient> _patients = [];
  int _nextId = 1;

  Future<void> init() async {
    // Initialize repository if needed
  }

  Future<List<Patient>> getPatients() async {
    try {
      await Future.delayed(const Duration(milliseconds: 800));
      return List.from(_patients);
    } catch (e) {
      throw Exception('Failed to fetch patients from storage');
    }
  }

  Future<Patient> getPatient(int id) async {
    try {
      await Future.delayed(const Duration(milliseconds: 500));
      return _patients.firstWhere(
        (p) => p.id == id,
        orElse: () => throw Exception('Patient not found'),
      );
    } catch (e) {
      throw Exception('Failed to fetch patient details');
    }
  }

  Future<Patient> createPatient(Patient patient) async {
    try {
      await Future.delayed(const Duration(milliseconds: 1000));
      final newPatient = Patient(
        id: _nextId++,
        name: patient.name,
        age: patient.age,
        gender: patient.gender,
        phone: patient.phone,
        address: patient.address,
        medicalHistory: patient.medicalHistory,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );
      _patients.add(newPatient);
      return newPatient;
    } catch (e) {
      throw Exception('Failed to create patient record');
    }
  }

  Future<Patient> updatePatient(Patient patient) async {
    try {
      await Future.delayed(const Duration(milliseconds: 1000));
      final index = _patients.indexWhere((p) => p.id == patient.id);
      if (index == -1) {
        throw Exception('Patient not found');
      }

      final updatedPatient = patient.copyWith(
        updatedAt: DateTime.now(),
      );
      _patients[index] = updatedPatient;
      return updatedPatient;
    } catch (e) {
      throw Exception('Failed to update patient record');
    }
  }

  Future<void> deletePatient(int id) async {
    try {
      await Future.delayed(const Duration(milliseconds: 800));
      final index = _patients.indexWhere((p) => p.id == id);
      if (index == -1) {
        throw Exception('Patient not found');
      }
      _patients.removeAt(index);
    } catch (e) {
      throw Exception('Failed to delete patient record');
    }
  }
}
