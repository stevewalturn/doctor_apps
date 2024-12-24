import 'package:stacked/stacked_annotations.dart';

class AnalyticService implements InitializableDependency {
  @override
  Future<void> init() async {
    // Initialize analytics service
    // This is a placeholder for actual analytics implementation
  }

  void logEvent(String eventName, {Map<String, dynamic>? parameters}) {
    // Log analytics event
    // This is a placeholder for actual analytics implementation
  }

  void logScreenView(String screenName) {
    logEvent('screen_view', parameters: {'screen_name': screenName});
  }

  void logPatientCreated() {
    logEvent('patient_created');
  }

  void logPatientUpdated() {
    logEvent('patient_updated');
  }

  void logPatientDeleted() {
    logEvent('patient_deleted');
  }
}
