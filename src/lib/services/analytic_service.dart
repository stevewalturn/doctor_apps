import 'package:stacked/stacked_annotations.dart';

class AnalyticService implements InitializableDependency {
  @override
  Future<void> init() async {
    // Initialize analytics service if needed
  }

  Future<void> logEvent(String eventName, {Map<String, dynamic>? parameters}) async {
    // Add actual analytics implementation here
    await Future.delayed(const Duration(milliseconds: 100)); // Simulate async operation
  }
}