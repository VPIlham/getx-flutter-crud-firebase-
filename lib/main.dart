import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ilham_firebase/app/controllers/auth_controller.dart';
import 'package:ilham_firebase/app/utils/loading.dart';

import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final authC = Get.put(AuthController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: authC.streamAuthStatus,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          print(snapshot.data);
          return GetMaterialApp(
            title: "Application",
            //kalau ada session
            initialRoute:
                snapshot.data != null && snapshot.data!.emailVerified == true
                    ? Routes.HOME
                    : Routes.LOGIN,
            // home: snapshot.data != null ? HomeView() : LoginView(),
            getPages: AppPages.routes,
          );
        } else {
          return LoadingView();
        }
      },
    );
  }
}
