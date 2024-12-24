import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:doctor_apps/features/patient/patient_form_viewmodel.dart';
import 'package:doctor_apps/features/patient/widgets/patient_form_fields.dart';
import 'package:doctor_apps/ui/common/app_colors.dart';
import 'package:doctor_apps/ui/common/ui_helpers.dart';

class PatientFormView extends StackedView<PatientFormViewModel> {
  final int? patientId;

  const PatientFormView({Key? key, this.patientId}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    PatientFormViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: AppBar(
        title: Text(patientId == null ? 'Add Patient' : 'Edit Patient'),
        backgroundColor: kcPrimaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            if (viewModel.modelError != null)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  viewModel.modelError.toString(),
                  style: const TextStyle(color: Colors.red),
                ),
              ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    PatientFormFields(
                      onNameChanged: viewModel.setName,
                      onAgeChanged: viewModel.setAge,
                      onGenderChanged: viewModel.setGender,
                      onPhoneChanged: viewModel.setPhone,
                      onAddressChanged: viewModel.setAddress,
                      onMedicalHistoryChanged: viewModel.setMedicalHistory,
                      initialValues: viewModel.patient,
                      isLoading: viewModel.isBusy,
                    ),
                    verticalSpaceMedium,
                  ],
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: kcPrimaryColor,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                onPressed: viewModel.isBusy ? null : viewModel.savePatient,
                child: viewModel.isBusy
                    ? const CircularProgressIndicator(color: Colors.white)
                    : const Text(
                        'Save Patient',
                        style: TextStyle(fontSize: 16),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  PatientFormViewModel viewModelBuilder(BuildContext context) =>
      PatientFormViewModel(patientId: patientId);

  @override
  void onViewModelReady(PatientFormViewModel viewModel) =>
      viewModel.initialize();
}
