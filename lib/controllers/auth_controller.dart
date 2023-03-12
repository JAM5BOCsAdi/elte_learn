import 'package:elte_learn/packages_barrel/packages_barrel.dart';

import '../../firebase_ref/references.dart';
import '../../routes/route_names.dart';
import '../../utils/app_logger.dart';
import '../widgets/dialogue.dart';

class AuthController extends GetxController {
  // static AuthController get to => Get.find<AuthController>(tag: "auth");
  late FirebaseAuth _firebaseAuth;
  late Stream<User?> _authStateChanges;

  final _user = Rxn<User>();

  @override
  void onReady() {
    initAuth();
    super.onReady();
  }

  Future<void> initAuth() async {
    await Future.delayed(const Duration(seconds: 2));
    _firebaseAuth = FirebaseAuth.instance;
    _authStateChanges = _firebaseAuth.authStateChanges();
    _authStateChanges.listen((User? user) {
      _user.value = user;
    });
    navigateToIntroduction();
  }

  Future<void> signInWithGoogle() async {
    final GoogleSignIn googleSignIn = GoogleSignIn();
    try {
      GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
      if (googleSignInAccount != null) {
        final googleAuthAccount = await googleSignInAccount.authentication;
        final googleAuthAccountCredential = GoogleAuthProvider.credential(
          idToken: googleAuthAccount.idToken,
          accessToken: googleAuthAccount.accessToken,
        );
        await _firebaseAuth.signInWithCredential(googleAuthAccountCredential);
        await saveUser(googleSignInAccount);
        navigateToHomePage();
      }
    } on Exception catch (error) {
      AppLogger.e(error);
    }
  }

  Future<void> saveUser(GoogleSignInAccount account) async {
    userRef.doc(account.email).set({
      "email": account.email,
      "name": account.displayName,
      "profilepic": account.photoUrl,
    });
  }

  User? getUser() {
    _user.value = _firebaseAuth.currentUser;
    return _user.value;
  }

  Future<void> signOut() async {
    AppLogger.d("Kijelentkezés");
    try {
      await _firebaseAuth.signOut();
      navigateToHomePage();
    } on FirebaseAuthException catch (e) {
      AppLogger.e(e);
    }
  }

  void navigateToIntroduction() => Get.offAllNamed(RouteNames.introductionScreenRoute);
  void navigateToLogin() => Get.toNamed(RouteNames.loginScreenRoute);
  void navigateToHomePage() => Get.offAllNamed(RouteNames.myZoomDrawerScreenRoute);

  void showLoginAlertDialogue() {
    Get.dialog(
      Dialogs.questionStartDialogue(
        onTapOK: () {
          // Navigate To Login Page
          // Get.offAllNamed("/introduction");
          navigateToLogin();
        },
        onTapCancel: () => Get.back(),
      ),
      barrierDismissible: false,
    );
  }

  bool isLoggedIn() {
    return _firebaseAuth.currentUser != null;
  }
}
