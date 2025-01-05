import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:doctor_apps/features/home/home_viewmodel.dart';
import 'package:doctor_apps/features/home/widgets/home_action_button.dart';
import 'package:doctor_apps/features/home/widgets/home_stats_card.dart';
import 'package:doctor_apps/ui/common/app_colors.dart';
import 'package:doctor_apps/ui/common/ui_helpers.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    HomeViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: kcBackgroundColor,
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: viewModel.refreshDashboard,
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                floating: true,
                backgroundColor: kcPrimaryColor,
                title: const Text(
                  'Doctor\'s Dashboard',
                  style: TextStyle(color: Colors.white),
                ),
                actions: [
                  IconButton(
                    icon: const Icon(Icons.notifications_outlined,
                        color: Colors.white),
                    onPressed: () {
                      // TODO: Implement notifications
                    },
                  ),
                ],
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (viewModel.modelError != null)
                        Padding(
                          padding: const EdgeInsets.only(bottom: 16.0),
                          child: Text(
                            viewModel.modelError.toString(),
                            style: const TextStyle(color: kcErrorRed),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      const Text(
                        'Statistics',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: kcDarkGreyColor,
                        ),
                      ),
                      verticalSpaceSmall,
                      if (viewModel.isBusy)
                        const Center(child: CircularProgressIndicator())
                      else
                        GridView.count(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          crossAxisCount: 2,
                          mainAxisSpacing: 16,
                          crossAxisSpacing: 16,
                          childAspectRatio: 1.5,
                          children: [
                            HomeStatsCard(
                              title: 'Total Patients',
                              value: viewModel.totalPatients.toString(),
                              icon: Icons.people,
                              onTap: viewModel.navigateToPatientList,
                            ),
                            HomeStatsCard(
                              title: 'New Patients',
                              value: viewModel.recentPatients.toString(),
                              icon: Icons.person_add,
                              backgroundColor:
                                  kcPrimaryColorLight.withOpacity(0.1),
                              iconColor: kcPrimaryColorLight,
                            ),
                          ],
                        ),
                      verticalSpaceMedium,
                      const Text(
                        'Quick Actions',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: kcDarkGreyColor,
                        ),
                      ),
                      verticalSpaceSmall,
                      GridView.count(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        crossAxisCount: 3,
                        mainAxisSpacing: 16,
                        crossAxisSpacing: 16,
                        children: [
                          HomeActionButton(
                            title: 'Add Patient',
                            icon: Icons.person_add,
                            onTap: viewModel.navigateToAddPatient,
                          ),
                          HomeActionButton(
                            title: 'View Patients',
                            icon: Icons.people,
                            onTap: viewModel.navigateToPatientList,
                          ),
                          HomeActionButton(
                            title: 'Settings',
                            icon: Icons.settings,
                            onTap: () {
                              // TODO: Implement settings
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  HomeViewModel viewModelBuilder(BuildContext context) => HomeViewModel();

  @override
  void onViewModelReady(HomeViewModel viewModel) => viewModel.initialize();
}
