import 'package:flutter/material.dart';
import 'package:doctor_apps/app/app.router.dart';
import 'package:doctor_apps/features/app/app_viewmodel.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: AppViewModel.new,
      builder: (_, __, ___) {
        return const _App();
      },
    );
  }
}

class _App extends ViewModelWidget<AppViewModel> {
  const _App();

  @override
  Widget build(BuildContext context, AppViewModel viewModel) {
    return MediaQuery.withClampedTextScaling(
      maxScaleFactor: 1.5,
      minScaleFactor: 0.5,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          /// Unfocus and hide keyboard when tap on white spaces
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: MaterialApp(
          initialRoute: Routes.startupView,
          onGenerateRoute: StackedRouter().onGenerateRoute,
          navigatorKey: StackedService.navigatorKey,
          navigatorObservers: [
            StackedService.routeObserver,
          ],
        ),
      ),
    );
  }
}
