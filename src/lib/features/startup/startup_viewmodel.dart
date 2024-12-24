import 'package:doctor_apps/app/app.locator.dart';
import 'package:doctor_apps/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class StartupViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  Future<void> runStartupLogic() async {
    try {
      await Future.delayed(const Duration(seconds: 2));
      await _navigationService.clearStackAndShow('/patient-list');
    } catch (e) {
      setError(
          'Unable to start application. Please check your internet connection and try again.');
    }
  }
}
