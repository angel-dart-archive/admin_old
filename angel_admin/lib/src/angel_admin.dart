import 'package:angel_framework/angel_framework.dart';
import 'service_config.dart';

class AngelAdmin extends Router {
  final List<ServiceConfiguration> serviceConfig;

  AngelAdmin({this.serviceConfig}) {
    get('/schema', schema);
  }

  Map<String, dynamic> get schema {
    return {
      'services': serviceConfig
    };
  }
}