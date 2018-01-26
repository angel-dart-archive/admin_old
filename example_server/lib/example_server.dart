library example_server;

import 'dart:async';
import 'package:angel_admin/angel_admin.dart';
import 'package:angel_auth/angel_auth.dart';
import 'package:angel_cors/angel_cors.dart';
import 'package:angel_framework/angel_framework.dart';
import 'package:file/local.dart';
import 'src/config/config.dart' as configuration;
import 'src/models/user.dart';
import 'src/routes/routes.dart' as routes;
import 'src/services/services.dart' as services;

/// Configures the server instance.
Future configureServer(Angel app) async {
  // Enable CORS
  app.use(cors());

  // Set up our application, using the plug-ins defined with this project.
  await app.configure(configuration.configureServer(const LocalFileSystem()));

  var auth = new AngelAuth<User>(
    jwtKey: app.configuration['jwt_secret'],
    allowCookie: false,
  );

  auth.serializer = (User user) => user.id;

  auth.deserializer = (String id) => app.service('api/users').read(id).then(User.parse);

  app.use(auth.decodeJwt);
  await app.configure(auth.configureServer);

  await app.configure(services.configureServer);

  app.mount(
    '/admin',
    new AngelAdmin(
      auth: auth,
      serviceConfig: [
        new ServiceConfiguration(path: 'api/todos'),
      ],
    ),
  );

  await app.configure(routes.configureServer(const LocalFileSystem()));
}
