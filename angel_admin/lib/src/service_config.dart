library angel_admin.src.service;

import 'package:meta/meta.dart';

class ServiceConfiguration {
  final String path, name, icon;

  ServiceConfiguration({@required this.path, this.name, this.icon});

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'path': path,
      'icon': icon,
    };
  }
}
