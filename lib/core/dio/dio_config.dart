import 'package:injectable/injectable.dart';

abstract class IConfig {
  String get baseUrl;

  Map<String, String> get headers;
}

@Injectable(as: IConfig)
class DioConfig extends IConfig {
  @override
  String get baseUrl => "https://api.artic.edu/api/v1";

  @override
  Map<String, String> get headers => {};
}
