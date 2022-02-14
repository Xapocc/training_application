import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:training_application/app/scene/login/cubit/login_state.dart';
import 'package:training_application/main.dart';

class LoginScreenCubit extends Cubit<LoginScreenState> {
  LoginScreenCubit() : super(LoginScreenState());

  Future<bool> continueAsGuest() async {
    emit(AwaitingLoginState());
    await auth?.signInAnonymously();
    emit(LoginScreenState());
    return auth?.currentUser == null ? false : true;
  }

  Future<bool> tryGoogleLogin() async {
    emit(AwaitingLoginState());
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    if (googleAuth?.accessToken == null || googleAuth?.idToken == null) {
      emit(LoginScreenState());
      return false;
    }

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    await auth?.signInWithCredential(credential);

    emit(LoginScreenState());
    // Once signed in, return the UserCredential
    return auth?.currentUser == null ? false : true;
  }
}
