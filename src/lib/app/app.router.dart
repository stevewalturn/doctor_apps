// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedNavigatorGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:doctor_apps/features/patient/patient_detail_view.dart' as _i5;
import 'package:doctor_apps/features/patient/patient_form_view.dart' as _i4;
import 'package:doctor_apps/features/patient/patient_list_view.dart' as _i3;
import 'package:doctor_apps/features/startup/startup_view.dart' as _i2;
import 'package:flutter/material.dart' as _i6;
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i7;

class Routes {
  static const startupView = '/';

  static const patientListView = '/patient-list-view';

  static const patientFormView = '/patient-form-view';

  static const patientDetailView = '/patient-detail-view';

  static const all = <String>{
    startupView,
    patientListView,
    patientFormView,
    patientDetailView,
  };
}

class StackedRouter extends _i1.RouterBase {
  final _routes = <_i1.RouteDef>[
    _i1.RouteDef(
      Routes.startupView,
      page: _i2.StartupView,
    ),
    _i1.RouteDef(
      Routes.patientListView,
      page: _i3.PatientListView,
    ),
    _i1.RouteDef(
      Routes.patientFormView,
      page: _i4.PatientFormView,
    ),
    _i1.RouteDef(
      Routes.patientDetailView,
      page: _i5.PatientDetailView,
    ),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.StartupView: (data) {
      return _i6.MaterialPageRoute<dynamic>(
        builder: (context) => const _i2.StartupView(),
        settings: data,
      );
    },
    _i3.PatientListView: (data) {
      return _i6.MaterialPageRoute<dynamic>(
        builder: (context) => const _i3.PatientListView(),
        settings: data,
      );
    },
    _i4.PatientFormView: (data) {
      final args = data.getArgs<PatientFormViewArguments>(
        orElse: () => const PatientFormViewArguments(),
      );
      return _i6.MaterialPageRoute<dynamic>(
        builder: (context) =>
            _i4.PatientFormView(key: args.key, patientId: args.patientId),
        settings: data,
      );
    },
    _i5.PatientDetailView: (data) {
      final args = data.getArgs<PatientDetailViewArguments>(nullOk: false);
      return _i6.MaterialPageRoute<dynamic>(
        builder: (context) =>
            _i5.PatientDetailView(key: args.key, patientId: args.patientId),
        settings: data,
      );
    },
  };

  @override
  List<_i1.RouteDef> get routes => _routes;

  @override
  Map<Type, _i1.StackedRouteFactory> get pagesMap => _pagesMap;
}

class PatientFormViewArguments {
  const PatientFormViewArguments({
    this.key,
    this.patientId,
  });

  final _i6.Key? key;

  final int? patientId;

  @override
  String toString() {
    return '{"key": "$key", "patientId": "$patientId"}';
  }

  @override
  bool operator ==(covariant PatientFormViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.patientId == patientId;
  }

  @override
  int get hashCode {
    return key.hashCode ^ patientId.hashCode;
  }
}

class PatientDetailViewArguments {
  const PatientDetailViewArguments({
    this.key,
    required this.patientId,
  });

  final _i6.Key? key;

  final int patientId;

  @override
  String toString() {
    return '{"key": "$key", "patientId": "$patientId"}';
  }

  @override
  bool operator ==(covariant PatientDetailViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.patientId == patientId;
  }

  @override
  int get hashCode {
    return key.hashCode ^ patientId.hashCode;
  }
}

extension NavigatorStateExtension on _i7.NavigationService {
  Future<dynamic> navigateToStartupView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.startupView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToPatientListView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.patientListView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToPatientFormView({
    _i6.Key? key,
    int? patientId,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.patientFormView,
        arguments: PatientFormViewArguments(key: key, patientId: patientId),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToPatientDetailView({
    _i6.Key? key,
    required int patientId,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.patientDetailView,
        arguments: PatientDetailViewArguments(key: key, patientId: patientId),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithStartupView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.startupView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithPatientListView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.patientListView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithPatientFormView({
    _i6.Key? key,
    int? patientId,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.patientFormView,
        arguments: PatientFormViewArguments(key: key, patientId: patientId),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithPatientDetailView({
    _i6.Key? key,
    required int patientId,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.patientDetailView,
        arguments: PatientDetailViewArguments(key: key, patientId: patientId),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }
}
