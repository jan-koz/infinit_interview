import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinit_interview/core/app/app.dart';
import 'package:infinit_interview/core/di/dependencies_container.dart';
import 'package:infinit_interview/core/utils/app_bloc_observer.dart';

void main() {
  configureDependencies();
  Bloc.observer = getIt.get<AppBlocObserver>();
  runApp(const MyApp());
}
