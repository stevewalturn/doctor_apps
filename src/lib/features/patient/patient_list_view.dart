import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:doctor_apps/features/patient/patient_list_viewmodel.dart';
import 'package:doctor_apps/features/patient/widgets/patient_card.dart';
import 'package:doctor_apps/ui/common/app_colors.dart';
import 'package:doctor_apps/ui/common/ui_helpers.dart';
import 'package:gap/gap.dart';

class PatientListView extends StackedView<PatientListViewModel> {
  const PatientListView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    PatientListViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: kcBackgroundColor,
      appBar: AppBar(
        title: const Text('Patients'),
        backgroundColor: kcPrimaryColor,
        actions: [
          PopupMenuButton<String>(
            icon: const Icon(Icons.sort),
            onSelected: (value) {
              switch (value) {
                case 'name_asc':
                  viewModel.sortPatientsByName(ascending: true);
                  break;
                case 'name_desc':
                  viewModel.sortPatientsByName(ascending: false);
                  break;
                case 'age_asc':
                  viewModel.sortPatientsByAge(ascending: true);
                  break;
                case 'age_desc':
                  viewModel.sortPatientsByAge(ascending: false);
                  break;
              }
            },
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: 'name_asc',
                child: Text('Sort by Name (A-Z)'),
              ),
              const PopupMenuItem(
                value: 'name_desc',
                child: Text('Sort by Name (Z-A)'),
              ),
              const PopupMenuItem(
                value: 'age_asc',
                child: Text('Sort by Age (Youngest)'),
              ),
              const PopupMenuItem(
                value: 'age_desc',
                child: Text('Sort by Age (Oldest)'),
              ),
            ],
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              onChanged: viewModel.onSearchQueryChanged,
              decoration: InputDecoration(
                hintText: 'Search patients...',
                prefixIcon: const Icon(Icons.search),
                suffixIcon: viewModel.searchQuery.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () => viewModel.onSearchQueryChanged(''),
                      )
                    : null,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: kcPrimaryColor),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: kcPrimaryColor, width: 2),
                ),
              ),
            ),
          ),
          if (viewModel.modelError != null)
            Container(
              padding: const EdgeInsets.all(8),
              margin: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: kcErrorRed.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  const Icon(Icons.error_outline, color: kcErrorRed),
                  const Gap(8),
                  Expanded(
                    child: Text(
                      viewModel.modelError.toString(),
                      style: const TextStyle(color: kcErrorRed),
                    ),
                  ),
                ],
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
                            Icon(
                              viewModel.searchQuery.isEmpty
                                  ? Icons.people_outline
                                  : Icons.search_off,
                              size: 64,
                              color: kcMediumGrey,
                            ),
                            const Gap(16),
                            Text(
                              viewModel.searchQuery.isEmpty
                                  ? 'No patients added yet'
                                  : 'No matching patients found',
                              style: const TextStyle(
                                color: kcMediumGrey,
                                fontSize: 16,
                              ),
                            ),
                            if (viewModel.searchQuery.isEmpty) ...[
                              const Gap(16),
                              ElevatedButton.icon(
                                onPressed: viewModel.navigateToAddPatient,
                                icon: const Icon(Icons.add),
                                label: const Text('Add New Patient'),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: kcPrimaryColor,
                                  foregroundColor: Colors.white,
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 24,
                                    vertical: 12,
                                  ),
                                ),
                              ),
                            ],
                          ],
                        ),
                      )
                    : RefreshIndicator(
                        onRefresh: viewModel.refreshPatients,
                        child: ListView.builder(
                          padding: const EdgeInsets.all(16),
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
      floatingActionButton: FloatingActionButton.extended(
        onPressed: viewModel.navigateToAddPatient,
        backgroundColor: kcPrimaryColor,
        icon: const Icon(Icons.add),
        label: const Text('Add Patient'),
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
