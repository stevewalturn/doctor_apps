import 'package:doctor_apps/app/app.locator.dart';
import 'package:doctor_apps/models/patient.dart';
import 'package:doctor_apps/services/patient_service.dart';
import 'package:doctor_apps/utils/const/const.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class PatientFormViewModel extends BaseViewModel {
  final _patientService = locator<PatientService>();
  final _navigationService = locator<NavigationService>();

  final int? patientId;
  Patient? _patient;
  Patient? get patient => _patient;

  PatientFormViewModel({this.patientId});

  String? _name;
  int? _age;
  String? _gender;
  String? _phone;
  String? _address;
  String? _medicalHistory;

  Future<void> initialize() async {
    if (patientId != null) {
      try {
        setBusy(true);
        _patient = await _patientService.getPatient(patientId!);
        _name = _patient?.name;
        _age = _patient?.age;
        _gender = _patient?.gender;
        _phone = _patient?.phone;
        _address = _patient?.address;
        _medicalHistory = _patient?.medicalHistory;
        notifyListeners();
      } catch (e) {
        setError('Failed to load patient information. Please try again.');
      } finally {
        setBusy(false);
      }
    }
  }

  void setName(String value) {
    _name = value;
    notifyListeners();
  }

  void setAge(String value) {
    _age = int.tryParse(value);
    notifyListeners();
  }

  void setGender(String value) {
    _gender = value;
    notifyListeners();
  }

  void setPhone(String value) {
    _phone = value;
    notifyListeners();
  }

  void setAddress(String value) {
    _address = value;
    notifyListeners();
  }

  void setMedicalHistory(String value) {
    _medicalHistory = value;
    notifyListeners();
  }

  bool _validateInputs() {
    if (_name == null || _name!.length < kMinPatientNameLength) {
      setError(kErrorInvalidName);
      return false;
    }
    if (_age == null || _age! < kMinPatientAge || _age! > kMaxPatientAge) {
      setError(kErrorInvalidAge);
      return false;
    }
    if (_gender == null || _gender!.isEmpty) {
      setError(kErrorInvalidGender);
      return false;
    }
    if (_phone == null || _phone!.length != kPhoneNumberLength) {
      setError(kErrorInvalidPhone);
      return false;
    }
    return true;
  }

  Future<void> savePatient() async {
    if (!_validateInputs()) return;

    try {
      setBusy(true);
      final patient = Patient(
        id: patientId,
        name: _name!,
        age: _age!,
        gender: _gender!,
        phone: _phone!,
        address: _address ?? '',
        medicalHistory: _medicalHistory ?? '',
      );

      if (patientId != null) {
        await _patientService.updatePatient(patient);
      } else {
        await _patientService.createPatient(patient);
      }

      _navigationService.back();
    } catch (e) {
      setError(kErrorSavingPatient);
    } finally {
      setBusy(false);
    }
  }
}
