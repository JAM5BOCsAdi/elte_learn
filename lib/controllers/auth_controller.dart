import 'package:elte_learn/packages_barrel/packages_barrel.dart';
import 'package:elte_learn/utils/app_logger.dart';

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

  signInWithGoogle() async {
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
        // await saveUser(account); ///TODO: UNCOMMENT THIS
      }
    } on Exception catch (error) {
      AppLogger.e(error);
    }
  }

  saveUser(GoogleSignInAccount account) {}

  void navigateToIntroduction() => Get.offAllNamed("/introduction");
}
