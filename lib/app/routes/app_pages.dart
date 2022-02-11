import 'package:get/get.dart';

import 'package:ilham_firebase/app/modules/add_product/bindings/add_product_binding.dart';
import 'package:ilham_firebase/app/modules/add_product/views/add_product_view.dart';
import 'package:ilham_firebase/app/modules/edit_product/bindings/edit_product_binding.dart';
import 'package:ilham_firebase/app/modules/edit_product/views/edit_product_view.dart';
import 'package:ilham_firebase/app/modules/home/bindings/home_binding.dart';
import 'package:ilham_firebase/app/modules/home/views/home_view.dart';
import 'package:ilham_firebase/app/modules/login/bindings/login_binding.dart';
import 'package:ilham_firebase/app/modules/login/views/login_view.dart';
import 'package:ilham_firebase/app/modules/signup/bindings/signup_binding.dart';
import 'package:ilham_firebase/app/modules/signup/views/signup_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.SIGNUP,
      page: () => SignupView(),
      binding: SignupBinding(),
    ),
    GetPage(
      name: _Paths.ADD_PRODUCT,
      page: () => AddProductView(),
      binding: AddProductBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_PRODUCT,
      page: () => EditProductView(),
      binding: EditProductBinding(),
    ),
  ];
}
