import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:stacked/stacked.dart';
import 'package:doctor_apps/ui/common/app_colors.dart';
import 'package:doctor_apps/ui/common/ui_helpers.dart';
import 'package:doctor_apps/ui/views/startup/startup_viewmodel.dart';

class StartupView extends StackedView<StartupViewModel> {
  const StartupView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    StartupViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: kcBackgroundColor,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'DOCTOR APPS',
              style: TextStyle(
                fontSize: 40,
                color: Colors.white.withOpacity(0.8),
                fontWeight: FontWeight.w900,
              ),
            ),
            if (viewModel.modelError != null)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  viewModel.modelError.toString(),
                  style: const TextStyle(color: Colors.red),
                  textAlign: TextAlign.center,
                ),
              ),
            verticalSpaceMedium,
            const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation(Colors.white),
            ),
          ],
        ),
      ),
    );
  }

  @override
  StartupViewModel viewModelBuilder(BuildContext context) => StartupViewModel();

  @override
  void onViewModelReady(StartupViewModel viewModel) => SchedulerBinding.instance
      .addPostFrameCallback((timeStamp) => viewModel.runStartupLogic());
}
