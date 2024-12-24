import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:doctor_apps/features/patient/patient_detail_viewmodel.dart';
import 'package:doctor_apps/ui/common/app_colors.dart';
import 'package:doctor_apps/ui/common/ui_helpers.dart';
import 'package:gap/gap.dart';

class PatientDetailView extends StackedView<PatientDetailViewModel> {
  final int patientId;

  const PatientDetailView({Key? key, required this.patientId})
      : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    PatientDetailViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Patient Details'),
        backgroundColor: kcPrimaryColor,
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: viewModel.navigateToEdit,
          ),
        ],
      ),
      body: viewModel.isBusy
          ? const Center(child: CircularProgressIndicator())
          : viewModel.hasError
              ? Center(
                  child: Text(
                    viewModel.modelError.toString(),
                    style: const TextStyle(color: Colors.red),
                    textAlign: TextAlign.center,
                  ),
                )
              : viewModel.patient == null
                  ? const Center(child: Text('Patient not found'))
                  : SingleChildScrollView(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildInfoSection('Patient Information'),
                          _buildInfoTile('Name', viewModel.patient!.name),
                          _buildInfoTile(
                              'Age', '${viewModel.patient!.age} years'),
                          _buildInfoTile('Gender', viewModel.patient!.gender),
                          _buildInfoTile('Phone', viewModel.patient!.phone),
                          if (viewModel.patient!.address.isNotEmpty)
                            _buildInfoTile(
                                'Address', viewModel.patient!.address),
                          verticalSpaceMedium,
                          _buildInfoSection('Medical History'),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              viewModel.patient!.medicalHistory.isEmpty
                                  ? 'No medical history recorded'
                                  : viewModel.patient!.medicalHistory,
                              style: const TextStyle(fontSize: 16),
                            ),
                          ),
                        ],
                      ),
                    ),
    );
  }

  Widget _buildInfoSection(String title) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Gap(16),
        Text(
          title,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: kcPrimaryColor,
          ),
        ),
        const Divider(),
      ],
    );
  }

  Widget _buildInfoTile(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 100,
            child: Text(
              label,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                color: kcMediumGrey,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }

  @override
  PatientDetailViewModel viewModelBuilder(BuildContext context) =>
      PatientDetailViewModel(patientId: patientId);

  @override
  void onViewModelReady(PatientDetailViewModel viewModel) =>
      viewModel.initialize();
}
