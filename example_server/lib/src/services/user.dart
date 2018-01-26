library example_server.src.services.user;

import 'dart:io';
import 'package:angel_file_service/angel_file_service.dart';
import 'package:angel_framework/angel_framework.dart';
import 'package:file/local.dart';

AngelConfigurer configureServer() {
  return (Angel app) async {
    app.use(
      '/api/users',
      new JsonFileService(const LocalFileSystem().file('users_db.json')),
    );
  };
}
