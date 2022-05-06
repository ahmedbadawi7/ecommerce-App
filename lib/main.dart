import 'package:ecommerce/logic/AuthController/ThemController.dart';
import 'package:ecommerce/routes/AppRoutes.dart';
import 'package:ecommerce/utells/my_String.dart';
import 'package:ecommerce/utells/theme.dart';
import 'package:ecommerce/views/screens/welcom_Screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'language/localizion.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized(); //watrin to start farebase servies and RanApp
 await Firebase.initializeApp(); // setup all firebase servis
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
        translations: LocaliztionApp(), // الملف الرئيسي للترجمه
        locale: Locale(GetStorage().read<String>('lang').toString()),    // بيتم بواسطته تشغيل اللغه
        fallbackLocale: Locale(ene),  // اللغه الام للتطبيق في حاله حصل اي خطاء في جلبgit
        // ملفات اللغه
        title: 'Toha Shop',
    theme:ThemesApp.light,
      darkTheme: ThemesApp.dark,
      themeMode: ThemeController().themeDataGet,
      initialRoute: FirebaseAuth.instance.currentUser!=null ||
          GetStorage().read<bool>("auth") == true?
      AppRoutes.mainScreen:AppRoutes.welcom,
      getPages: AppRoutes.routes
    );
  }
}
