import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

@injectable
class AppLogger extends Logger {
  void logBloc(String previousBloc, String currentBloc) {
    log(
      Level.debug,
      "Previous state: $previousBloc.\nNext state: $currentBloc",
    );
  }
}
