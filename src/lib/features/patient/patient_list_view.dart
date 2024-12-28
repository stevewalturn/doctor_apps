import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:doctor_apps/features/patient/patient_list_viewmodel.dart';
import 'package:doctor_apps/features/patient/widgets/patient_card.dart';
import 'package:doctor_apps/ui/common/app_colors.dart';
import 'package:doctor_apps/ui/common/ui_helpers.dart';

class PatientListView extends StackedView<PatientListViewModel> {
  const PatientListView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    PatientListViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Patients'),
        backgroundColor: kcPrimaryColor,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              onChanged: viewModel.onSearchQueryChanged,
              decoration: const InputDecoration(
                hintText: 'Search patients by name or phone...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          if (viewModel.modelError != null)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                viewModel.modelError.toString(),
                style: const TextStyle(color: kcErrorRed),
                textAlign: TextAlign.center,
              ),
            ),
          Expanded(
            child: viewModel.isBusy
                ? const Center(child: CircularProgressIndicator())
                : viewModel.patients.isEmpty
                    ? Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.person_search,
                              size: 64,
                              color: kcMediumGrey,
                            ),
                            verticalSpaceSmall,
                            Text(
                              viewModel.searchQuery.isEmpty
                                  ? 'No patients found'
                                  : 'No matching patients found',
                              style: const TextStyle(color: kcMediumGrey),
                            ),
                          ],
                        ),
                      )
                    : RefreshIndicator(
                        onRefresh: viewModel.refreshPatients,
                        child: ListView.builder(
                          itemCount: viewModel.patients.length,
                          itemBuilder: (context, index) {
                            final patient = viewModel.patients[index];
                            return PatientCard(
                              patient: patient,
                              onTap: () => viewModel
                                  .navigateToPatientDetail(patient.id!),
                              onDelete: () =>
                                  viewModel.deletePatient(patient.id!),
                            );
                          },
                        ),
                      ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: viewModel.navigateToAddPatient,
        backgroundColor: kcPrimaryColor,
        child: const Icon(Icons.add),
      ),
    );
  }

  @override
  PatientListViewModel viewModelBuilder(BuildContext context) =>
      PatientListViewModel();

  @override
  void onViewModelReady(PatientListViewModel viewModel) =>
      viewModel.initialize();
}
