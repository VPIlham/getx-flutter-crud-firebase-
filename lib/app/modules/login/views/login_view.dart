import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ilham_firebase/app/controllers/auth_controller.dart';
import 'package:ilham_firebase/app/routes/app_pages.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  final authC = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Screen'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          children: [
            TextField(
              controller: controller.emailC,
              decoration: InputDecoration(labelText: "Email"),
            ),
            TextField(
              controller: controller.passC,
              decoration: InputDecoration(labelText: "Password"),
            ),
            SizedBox(
              height: 50,
            ),
            ElevatedButton(
              onPressed: () =>
                  authC.login(controller.emailC.text, controller.passC.text),
              child: Text("Login"),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Belum punya akun ?"),
                TextButton(
                    onPressed: () => Get.toNamed(Routes.SIGNUP),
                    child: Text("Daftar Sekarang"))
              ],
            )
          ],
        ),
      ),
    );
  }
}
