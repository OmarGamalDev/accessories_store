import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleAuthService {
  final GoogleSignIn googleSignIn = GoogleSignIn(scopes: ['email']);

  Future<String?> signIn() async {
    try {
      final account = await googleSignIn.signIn();

      if (account == null) {
        debugPrint('❌ User cancelled Google Sign In');
        return null;
      }

      final auth = await account.authentication;

      debugPrint('✅ Google Sign In successful');
      debugPrint('📧 Email: ${account.email}');
      debugPrint('👤 Name: ${account.displayName}');

      return auth.idToken;
    } catch (e) {
      debugPrint('❌ Error signing in with Google: $e');
      return null;
    }
  }

  Future<void> signOut() async {
    try {
      await googleSignIn.signOut();
      debugPrint('✅ Google Sign Out successful');
    } catch (e) {
      debugPrint('❌ Error signing out from Google: $e');
    }
  }

  Future<bool> isSignedIn() async {
    return await googleSignIn.isSignedIn();
  }

  GoogleSignInAccount? getCurrentUser() {
    return googleSignIn.currentUser;
  }
}
