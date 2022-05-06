import 'package:ecommerce/Binding/AuthBinding.dart';
import 'package:ecommerce/Binding/LoginBindings.dart';
import 'package:ecommerce/Binding/MainBinding.dart';
import 'package:ecommerce/Binding/Product_binding.dart';
import 'package:ecommerce/logic/AuthController/AuthController.dart';
import 'package:ecommerce/views/paymentScreen.dart';
import 'package:ecommerce/views/screens/CartScreen.dart';
import 'package:ecommerce/views/screens/Auth/Forget_Passsord.dart';
import 'package:ecommerce/views/screens/Auth/Login_Screen.dart';
import 'package:ecommerce/views/screens/Auth/Regstrison_Screen.dart';
import 'package:ecommerce/views/screens/main_Screen.dart';
import 'package:ecommerce/views/screens/welcom_Screen.dart';
import 'package:get/get.dart';

class AppRoutes{
  static const welcom = Routes.welcom;
  static const login = Routes.LoginScreen;
  static const Regstrision = Routes.Regstrision;
  static const forgetpassword = Routes.ForgetPasswordScreen;
  static const mainScreen = Routes.MainScreen;
  static const cartscreen = Routes.CartScreen;
  static const payment = Routes.PaymentScreen;


  static final routes = [
    GetPage(name: Routes.welcom, page:()=> const WelcomScreen()),
    GetPage(name: Routes.LoginScreen, page:()=> LoginScreen(),binding: AuthBinding()),
    GetPage(name: Routes.Regstrision, page:()=> RegsterionScreen(),binding: AuthBinding()),
    GetPage(name: Routes.ForgetPasswordScreen, page:()=> ForgetPassword(),binding: AuthBinding()),
    GetPage(name: Routes.MainScreen, page:()=> MainScreen(),bindings: [AuthBinding(),MainBinding(),productBinding()]),
    GetPage(name: Routes.CartScreen, page:()=> CartScreen(),bindings: [AuthBinding(),productBinding()]),
    GetPage(name: Routes.PaymentScreen, page:()=> PaymentScreen(),bindings: [MainBinding(),AuthBinding(),productBinding()]),


  ];

}


class Routes{
  static const welcom = '/welcom';
  static const LoginScreen = '/LoginScreen';
  static const Regstrision ='/SingUpScreen';
  static const ForgetPasswordScreen ='/ForgetPassword';
  static const MainScreen ='/MainScreen';
  static const CartScreen ='/CartScreen';
static const PaymentScreen ='/PaymentScreen';



}