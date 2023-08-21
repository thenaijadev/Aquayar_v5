import 'dart:convert';
import 'dart:math';

import 'package:aquayar/config/network/typedef.dart';
import 'package:crypto/crypto.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_appauth/flutter_appauth.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SuperBaseAuthProvider {
  String _generateRandomString() {
    final random = Random.secure();
    return base64Url.encode(List<int>.generate(16, (_) => random.nextInt(256)));
  }

  EitherUser signUpWithGoogle() async {
    try {
      final supabase = Supabase.instance.client;
      // Just a random string
      final rawNonce = _generateRandomString();
      final hashedNonce = sha256.convert(utf8.encode(rawNonce)).toString();

      var clientId = defaultTargetPlatform == TargetPlatform.iOS
          ? '781610542696-ebj3s2cto9kcp6irj9m0sl9ek8g3281a.apps.googleusercontent.com'
          : "781610542696-8bf38mslke86mju6jdu5acokkkiacl2v.apps.googleusercontent.com";

      final redirectUrl = '${clientId.split('.').reversed.join('.')}:/';

      const discoveryUrl =
          'https://accounts.google.com/.well-known/openid-configuration';

      const appAuth = FlutterAppAuth();

      final result = await appAuth.authorize(
        AuthorizationRequest(
          clientId,
          redirectUrl,
          discoveryUrl: discoveryUrl,
          nonce: hashedNonce,
          scopes: [
            'openid',
            'email',
          ],
        ),
      );

      if (result == null) {
        throw 'No result';
      }
      final tokenResult = await appAuth.token(
        TokenRequest(
          clientId,
          redirectUrl,
          authorizationCode: result.authorizationCode,
          discoveryUrl: discoveryUrl,
          codeVerifier: result.codeVerifier,
          nonce: result.nonce,
          scopes: [
            'openid',
            'email',
          ],
        ),
      );
      final idToken = tokenResult?.idToken;
      if (idToken == null) {
        throw 'No idToken';
      }

      final res = await supabase.auth.signInWithIdToken(
        provider: Provider.google,
        idToken: idToken,
        nonce: rawNonce,
      );

      final User? user = res.user;

      return right(user!);
    } on AuthException catch (e) {
      return left(e.message);
    } catch (e) {
      return left(e.toString());
    }
  }
}
