import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:study_app/firebase_ref/refrences.dart';

import '../../widgets/dialogs_widget.dart';

class AuthController extends GetxController{
  late FirebaseAuth _auth;

  late Stream<User?> _authStateChanges;

  @override
  void onReady() {
    initAuth();
    super.onReady();
  }

  void initAuth(){
    _auth = FirebaseAuth.instance;
    _authStateChanges = _auth.authStateChanges();
    _authStateChanges.listen((User? user) {
      update();
    });

    navigateToIntroduction();
  }

  signInWithGoogle()async{
    final _googleSignIn = GoogleSignIn();
    try{
      GoogleSignInAccount? googleSignInAccount = await _googleSignIn.signIn();
      if(googleSignInAccount != null){
        final authAccount = await googleSignInAccount.authentication;
        final credential = GoogleAuthProvider.credential(
          idToken: authAccount.idToken,
          accessToken: authAccount.accessToken
        );
        await _auth.signInWithCredential(credential);
        await saveUser(googleSignInAccount);
        navigateToHome();
      }
    }
    on Exception catch(e){
      print(e);
    }
  }

  User? getUser() => _auth.currentUser;

  Future<void> saveUser(GoogleSignInAccount account)async {
    userRef.doc(account.email).set({
      'email': account.email,
      'name': account.displayName,
      'profilePic': account.photoUrl
    });
  }

  void navigateToIntroduction()async{
    await Future.delayed(const Duration(milliseconds: 1500));
    Get.offAllNamed("/introduction");
  }

  void navigateToHome(){
    Get.offAllNamed("/home");
  }

  void showLoginAlertDialog(){
    Get.dialog(
      Dialogs.questionStartDialog(onTap: (){
        Get.toNamed("/login");
      }),
    );
  }

  bool isLoggedIn(){
    return _auth.currentUser != null;
  }

  Future<void> signOut()async{
    try{
      await _auth.signOut();
      navigateToHome();
      update();
    }

    on FirebaseAuthException catch(e){
      print(e);
    }
  }
}