import 'package:ecommerce/language/ar.dart';
import 'package:ecommerce/language/en.dart';
import 'package:ecommerce/language/fn.dart';
import 'package:ecommerce/utells/my_String.dart';
import 'package:get/get.dart';

class LocaliztionApp extends Translations{
  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys =>{
    ene : en,
    ara : ar,
    frf : fr
  };

}