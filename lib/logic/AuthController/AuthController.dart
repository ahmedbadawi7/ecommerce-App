import 'package:ecommerce/model/FaceBookModel.dart';
import 'package:ecommerce/routes/AppRoutes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthController extends GetxController{
  var isLoading = false.obs;
  final Regstrion_formkey = GlobalKey<FormState>();
  final Login_formkey = GlobalKey<FormState>();
  final RestformKey = GlobalKey<FormState>();
  late TextEditingController nameController,emailController,passwordController;
  bool isVisibilty = false;
  bool isCheckBox = false;
  FirebaseAuth auth = FirebaseAuth.instance;
  var GoogleSingIn = GoogleSignIn();
  FaceBookModel? faceBookModel;
  var DisplayUserPhoto=''.obs;
  String? name,email,password;

  var yourName= ''.obs;
  var yourEmail=''.obs;

  var isSigneIn = false;

  final GetStorage authbox =GetStorage();
  User ? get userProfile => auth.currentUser;

  @override
  void onInit() {
   nameController= TextEditingController();
   passwordController= TextEditingController();
   emailController= TextEditingController();
                                                                    //ستدعاء البيانات المستخدمين  من ملف firebase direct
   yourName.value = (userProfile != null ? userProfile!.displayName : "")!;
   yourEmail.value = (userProfile != null ? userProfile!.email : "")!;
   DisplayUserPhoto.value = (userProfile != null ? userProfile!.photoURL : "")!;


   super.onInit();
  }

  @override
  void dispose() {
    nameController.dispose();
    passwordController.dispose();
    emailController.dispose();
    super.dispose();
  }

  String? validateEmail(String email){
    if(!GetUtils.isEmail(email)){
      return "this is worng email".tr;
    }else{
      return null;
    }
  }
  String? validatePassword(String password){
    if(password.length <= 5){
      return "this is worng password".tr;
    }else{
      return null;
    }
  }
  void visibility() {
    isVisibilty = !isVisibilty;
    update();
  }
  void CheckBox(){
    isCheckBox = !isCheckBox;
    update();
  }
  void SingUpUsingFireBase({required name,required Email , required Password})async{
    try {
    await auth.createUserWithEmailAndPassword(
          email: Email,
          password: Password
      ).then((value){
        yourName =name;
        auth.currentUser!.updateDisplayName(name);
    });
    update();
    Get.offNamed(Routes.MainScreen);
    } on FirebaseAuthException catch (error) {
      String title =error.code.replaceAll(RegExp('-'),' ').capitalize!;//زح لي المسافات البلمعيار reg
      String message ='';
      if (error.code == 'weak-password') {
        message = 'The password provided is too weak.';
      } else if (error.code == 'email-already-in-use') {
        message = 'The account already exists for that email.';
      }else{
       message = error.message.toString();
      }
      Get.snackbar(title, message,
          snackPosition:SnackPosition.BOTTOM ,
          backgroundColor: Colors.green,colorText: Colors.white);
    } catch (e) {
      Get.snackbar('Error!', e.toString(),
          snackPosition:SnackPosition.BOTTOM ,
          backgroundColor: Colors.green,colorText: Colors.white);
    }
  }
  void GoogleUsingFireBase()async{
  try{
    final GoogleSignInAccount? googleUser = await GoogleSingIn.signIn();
    yourName.value=googleUser!.displayName!;
    DisplayUserPhoto.value=googleUser.photoUrl!;
    yourEmail.value=googleUser.email;

    // تحويل التحقق من قوقل الي ملف الفيربيز
    GoogleSignInAuthentication googleSignInAuthentication =
    await googleUser.authentication;
    final AuthCredential credential = GoogleAuthProvider.credential(
      idToken: googleSignInAuthentication.idToken,
      accessToken: googleSignInAuthentication.accessToken,
    );
    await auth.signInWithCredential(credential);

    Get.offNamed(Routes.MainScreen);
    isSigneIn = true;
    authbox.write("auth", isSigneIn);
    update();
  }catch(error){
    Get.snackbar('Error!', error.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green, colorText: Colors.white);
  }
  }

  void FaceBookUsingFireBase()async{
    final LoginResult loginResult = await FacebookAuth.instance.login();
    if(loginResult.status == LoginStatus.success){
      final data = await FacebookAuth.instance.getUserData();
      faceBookModel = FaceBookModel.fromJson(data);
      isSigneIn = true;
      Get.offNamed(Routes.MainScreen);
      authbox.write("auth", isSigneIn);
      update();
    }else{
      Get.snackbar('Error', "Can't logn with faceBook",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green, colorText: Colors.white);
    }

  }

  void SingInUsingFireBase({
    required String email,
    required String password
  }) async {
    try {
      await auth.signInWithEmailAndPassword(
          email: email,
          password: password
      ).then((value) => yourName.value = auth.currentUser!.displayName!);
      isSigneIn = true;
      authbox.write("auth", isSigneIn);
      update();
      Get.offNamed(Routes.MainScreen);
    }
    on FirebaseAuthException catch (error) {
      String title = error.code
          .replaceAll(RegExp('-'), ' ')
          .capitalize!; //زح لي المسافات البلمعيار reg
      String message = '';
      if (error.code == 'user-not-found') {
        message = 'No user found for that $email.';
      } else if (error.code == 'wrong-password') {
        message = 'Wrong password provided for that user.';
      } else {
        message = error.message.toString();
      }
      Get.snackbar(title, message,
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green, colorText: Colors.white);
    } catch (e) {
      Get.snackbar('Error!', e.toString(),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green, colorText: Colors.white);
    }
  }

  void ResetPasswordFireBase(String email) async {
    try {
      await auth.sendPasswordResetEmail(email: email);

      update();
      Get.back();
    }
    on FirebaseAuthException catch (error) {
      String title = error.code
          .replaceAll(RegExp('-'), ' ')
          .capitalize!; //زح لي المسافات البلمعيار reg
      String message = '';
      if (error.code == 'user-not-found') {
        message = 'No user found for that $email.';
      }else {
        message = error.message.toString();
      }
      Get.snackbar(title, message,
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green, colorText: Colors.white);
    } catch (e) {
      Get.snackbar('Error!', e.toString(),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green, colorText: Colors.white);
    }
  }

  void signOutFormApp()async{
    try{
      await auth.signOut();
      await GoogleSingIn.signOut();
      await FacebookAuth.i.logOut();
      yourName.value ='';
      DisplayUserPhoto.value ='';
      yourEmail.value='';
      isSigneIn = false;
      Get.offNamed(Routes.welcom);
      authbox.remove("auth");
      update();

    }catch(error){
      await Get.snackbar('Error!', error.toString(),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green, colorText: Colors.white);


    }
  }
}
