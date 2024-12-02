import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinit_interview/core/utils/logger.dart';
import 'package:injectable/injectable.dart';

@injectable
class AppBlocObserver extends BlocObserver {
  final AppLogger _logger;

  AppBlocObserver(this._logger);

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    _logger.logBloc(
      "${bloc.runtimeType}.${change.currentState.runtimeType.toString()}",
      "${bloc.runtimeType}.${change.nextState.runtimeType.toString()}",
    );
  }
}
