import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../view/auth_page/auth_page.dart';
import '../view/home_page/home_page.dart';

class AuthRepository extends GetxController {
  static AuthRepository get instance => Get.find();

  final _auth = FirebaseAuth.instance;
  final _googleAuth = GoogleSignIn();
  late final Rx<User?> firebaseUser;

  RxString verId = ''.obs;

  @override
  void onReady() {
    firebaseUser = Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());
    ever(firebaseUser, _setInitialScreen);
  }


  // Decide which screen to go on startup based on auth.
  void _setInitialScreen(User? user) {
    user == null
        ? Get.offAll(() => const Homepage())
        : Get.offAll(() => const Homepage());
  }

  Future<void> verifyPhoneNumber(String phoneNumber) async {
    await _auth.verifyPhoneNumber(
      phoneNumber: "+91$phoneNumber",
      verificationCompleted: (AuthCredential credential) async {
        await _auth.signInWithCredential(credential);
      },
      verificationFailed: (FirebaseAuthException e) {
        if (e.code == 'invalid-phone-number') {
          Get.snackbar('Error', 'The phone number is invalid');
        }
      },
      codeSent: (verificationId, resendToken) {
        verId.value = verificationId;
      },
      codeAutoRetrievalTimeout: (verificationId) {
        verId.value = verificationId;
      },
    );
  }

  Future<User?> verfiyOtp(String otp) async {
    final UserCredential userCredential = await _auth.signInWithCredential(
      PhoneAuthProvider.credential(
        verificationId: verId.value,
        smsCode: otp,
      ),
    );
    if (userCredential.user == null) return null;
    return userCredential.user;
  }

  Future<User?> googleAuthentication() async {
    final GoogleSignInAccount? googleUser = await _googleAuth.signIn();
    if (googleUser != null) {
      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final UserCredential userCredential = await _auth.signInWithCredential(credential);

      return userCredential.user;
    }
    return null;
  }

  Future<void> logout() async {
    await _auth.signOut();
  }
}
