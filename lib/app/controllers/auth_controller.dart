import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ilham_firebase/app/routes/app_pages.dart';

class AuthController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;

  Stream<User?> get streamAuthStatus => auth.authStateChanges();

  void signup(String email, String password) async {
    try {
      UserCredential myUser = await auth.createUserWithEmailAndPassword(
          email: email, password: password);

      await myUser.user!.sendEmailVerification();
      Get.defaultDialog(
        onConfirm: () {
          //close dialog
          Get.back();
          //back login
          Get.back();
        },
        title: "Verifikasi Email",
        middleText: "Verfikasi Emai telah dikirim",
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
        Get.defaultDialog(
          onConfirm: () => print("Ok"),
          middleText: "Gagal Login",
        );
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
        Get.defaultDialog(
          onConfirm: () => print("Ok"),
          middleText: "Akun sudah dipakai",
        );
      }
    } catch (e) {
      print(e);
    }
  }

  void login(String email, String password) async {
    try {
      UserCredential myUser = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      if (myUser.user!.emailVerified) {
        Get.offAllNamed(Routes.HOME);
      } else {
        Get.defaultDialog(
            onConfirm: () => print("Ok"),
            title: "Verifikasi Email",
            middleText: "Email Anda belum verifikasi");
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  void logout() async {
    await auth.signOut();
    Get.offAllNamed(Routes.LOGIN);
  }
}
