import 'package:elte_learn/firebase_ref/references.dart';
import 'package:elte_learn/packages_barrel/packages_barrel.dart';
import 'package:elte_learn/utils/app_logger.dart';
import 'package:elte_learn/widgets/dialogs/dialogue.dart';

class AuthController extends GetxController {
  // static AuthController get to => Get.find<AuthController>(tag: "auth");

  @override
  void onReady() {
    initAuth();
    super.onReady();
  }

  late FirebaseAuth _firebaseAuth;

  final _user = Rxn<User>();
  late Stream<User?> _authStateChanges;

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

  void navigateToIntroduction() => Get.offAllNamed("/introduction");

  void showLoginAlertDialogue() {
    Get.dialog(
      Dialogs.questionStartDialogue(
        onTapOK: () {
          // Navigate To Login Page
          // Get.offAllNamed("/introduction");
          navigateToIntroduction();
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
