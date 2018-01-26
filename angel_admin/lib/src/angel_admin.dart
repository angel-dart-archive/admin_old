import 'dart:async';
import 'package:angel_auth/angel_auth.dart';
import 'package:angel_framework/angel_framework.dart';
import 'package:angel_validate/server.dart';
import 'service_config.dart';

class AngelAdmin extends Router {
  final AngelAuth auth;
  final List<ServiceConfiguration> serviceConfig;

  final Validator _directAuth = new Validator({
    'user_id*': isString,
  });

  AngelAdmin({this.auth, this.serviceConfig}) {
    if (auth != null) {
      chain(validate(_directAuth)).post('/auth', directAuth);
    }

    get('/schema', schema);
  }

  Map<String, dynamic> get schema {
    return {'services': serviceConfig};
  }

  /// Signs a user in based solely on a user ID.
  Future directAuth(RequestContext req, ResponseContext res) async {
    String userId = req.body['user_id'];
    var token = new AuthToken(
      userId: userId,
      ipAddress: req.ip,
      issuedAt: new DateTime.now(),
      lifeSpan: -1,
      payload: {
        'angel_admin': 'direct_auth',
      },
    );

    await auth.login(token, req, res);
    return {
      'token': token.serialize(auth.hmac),
      'data': req.properties['user'],
    };
  }
}
