import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../view/auth_page.dart';
import '../view/home_page.dart';

class AuthRepository extends GetxController {
  static AuthRepository get instance => Get.find();

  final _auth = FirebaseAuth.instance;
  // final _fireStore = Firebase;
  late final Rx<User?> firebaseUser;

  RxString verId = ''.obs;

  @override
  void onReady() {
    firebaseUser = Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());
    ever(firebaseUser, _setInitialScreen);
  }

  void _setInitialScreen(User? user) {
    user == null ? Get.offAll(() => const AuthPage()) : Get.offAll(() => const Homepage());
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

  Future<bool> verfiyOtp(String otp) async {
    final UserCredential userCredential = await _auth.signInWithCredential(
      PhoneAuthProvider.credential(
        verificationId: verId.value,
        smsCode: otp,
      ),
    );
    if (userCredential.user == null) return false;
    return true;
  }

  Future<void> logout()async{
    await _auth.signOut();
  }

}
