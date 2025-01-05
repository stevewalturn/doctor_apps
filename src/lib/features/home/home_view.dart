import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:doctor_apps/features/home/home_viewmodel.dart';
import 'package:doctor_apps/features/home/widgets/home_action_button.dart';
import 'package:doctor_apps/features/home/widgets/home_stats_card.dart';
import 'package:doctor_apps/ui/common/app_colors.dart';
import 'package:doctor_apps/ui/common/ui_helpers.dart';
import 'package:gap/gap.dart';

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
                    onPressed: viewModel.showNotifications,
                  ),
                  IconButton(
                    icon: const Icon(Icons.settings_outlined,
                        color: Colors.white),
                    onPressed: viewModel.showSettings,
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
                        Container(
                          padding: const EdgeInsets.all(8),
                          margin: const EdgeInsets.only(bottom: 16),
                          decoration: BoxDecoration(
                            color: kcErrorRed.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            children: [
                              const Icon(Icons.error_outline,
                                  color: kcErrorRed),
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
                      const Text(
                        'Overview',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: kcDarkGreyColor,
                        ),
                      ),
                      verticalSpaceMedium,
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
                              title: 'New This Week',
                              value: viewModel.recentPatients.toString(),
                              icon: Icons.person_add,
                              backgroundColor:
                                  kcPrimaryColorLight.withOpacity(0.1),
                              iconColor: kcPrimaryColorLight,
                              onTap: viewModel.navigateToPatientList,
                            ),
                          ],
                        ),
                      verticalSpaceLarge,
                      const Text(
                        'Quick Actions',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: kcDarkGreyColor,
                        ),
                      ),
                      verticalSpaceMedium,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Expanded(
                            child: HomeActionButton(
                              title: 'Add Patient',
                              icon: Icons.person_add,
                              onTap: viewModel.navigateToAddPatient,
                            ),
                          ),
                          horizontalSpaceMedium,
                          Expanded(
                            child: HomeActionButton(
                              title: 'View All',
                              icon: Icons.people,
                              onTap: viewModel.navigateToPatientList,
                            ),
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
