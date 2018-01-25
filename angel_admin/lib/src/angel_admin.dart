import 'package:angel_framework/angel_framework.dart';
import 'service_config.dart';

class AngelAdmin extends Routable {
  final List<ServiceConfiguration> serviceConfig;

  AngelAdmin({this.serviceConfig}) {
    get('/schema', getSchema());
  }

  Map<String, dynamic> getSchema() {
    return {
      'services': serviceConfig
    };
  }
}