import 'package:ecommerce/utells/my_String.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SettingController extends GetxController{
    var switchValue = false.obs;
    var Storage = GetStorage();
    var LangLocal = ene;

    String capitalize(String profileNAme){
        return profileNAme.split(" ").map((name) => name.capitalize).join(" ");
    }

    // language
    @override
  void onInit() async {
    // TODO: implement onInit
        super.onInit();
        LangLocal = await getlanguage;
  }

    void savalanguage(String lang)async{
        await Storage.write("lang", lang);
    }

    Future<String> get getlanguage async{
        return await Storage.read("lang");
    }

    void changelanguage(String typeLang){
        savalanguage(typeLang);
       if(LangLocal == typeLang){
           return;
       }

       if(typeLang == frf){
           LangLocal = frf;
           savalanguage(frf);
       }else if(typeLang  ==ara){
           LangLocal = ara;
           savalanguage(ara);
       }else{       // تستخدم لتخزين اللغه الاساسيه
           LangLocal = ene;
           savalanguage(ene);
       }
       update();

    }


}